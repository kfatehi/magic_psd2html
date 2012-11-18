//
//  MDXAppDelegate.m
//  The Magic PSD to HTML Converter
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 MDX Research Labs All rights reserved.
//
//  psd2html-4.0-engine.app by Jonathan Silverman

#import "MDXAppDelegate.h"
#import "MDXHelper.h"

@implementation MDXAppDelegate
@synthesize mainLabel;
@synthesize progressMeter;
@synthesize psd2htmlPath, psd2htmlArgs;
@synthesize filePaths;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"bundle path.. %@", [[NSBundle mainBundle] bundlePath]);
    [_window setLevel:NSStatusWindowLevel];
    NSLog(@"Startup");
    [self ensureReadyState];
    // Wait a bit, make sure we've filled our set of PSDs...
    // Then launch psd2html-engine.app
    [self performSelector:@selector(processQueue) withObject:nil afterDelay:1.0];
}

- (BOOL) detectPhotoshop {
    NSLog(@"Detecting Photoshop");
    NSString *ps5path = @"/Applications/Adobe Photoshop CS6/Adobe Photoshop CS5.app";
    NSString *altps5path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), ps5path];
    NSString *ps6path = @"/Applications/Adobe Photoshop CS6/Adobe Photoshop CS6.app";
    NSString *altps6path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), ps6path];
    
    BOOL ps5 = (fileExists(@"/Applications/Adobe Photoshop CS5/MacOS") || fileExists(altps5path)) ? true : false;
    
    BOOL ps6 = (fileExists(ps6path) || fileExists(altps6path)) ? true : false;
    
    if (ps5) NSLog(@"Photoshop CS5 detected");
    if (ps6) NSLog(@"Photoshop CS6 detected");
    return (ps5 || ps6) ? true : false;
}

- (BOOL) ensureReadyState {
    // Consider this the entry point into the application.
    // This method gets called once and only once per launch at the very start.

    BOOL hasPhotoshop = [self detectPhotoshop];

    if (!hasPhotoshop) {
        showMsg(@"Could not find Photoshop here: /Applications/Adobe Photoshop CS5/");
        [self sayBye];
        return NO;
    }
    
    NSString *supportDir = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *gimpPath = [NSString pathWithComponents:[NSArray arrayWithObjects:supportDir, @"com.mdx.Gimp.app", nil]];
    
    NSLog(@"%@", gimpPath);
    // --------------

    BOOL hasGimp = [[NSFileManager defaultManager] fileExistsAtPath:gimpPath];
    
    if (!hasGimp) {
        // doesnt have gimp, an unzip was never attempted given that the directory doesn't even exist.
        // since it is using NSUSerDomainMask, we know there is no sane reason for it not to, so let's just extract from resources.
        NSString *gimpZip = [[NSBundle mainBundle] pathForResource:@"com.mdx.Gimp" ofType:@"zip"];
        showMsg(@"Installing support files. Please be patient.");
        // try to unzip it from our resources
        [[NSTask launchedTaskWithLaunchPath:@"/usr/bin/unzip" arguments:[NSArray arrayWithObjects:gimpZip, @"-d", supportDir, nil]] waitUntilExit];
        // TODO: use a proper zip lib that uses events.
        if ([[NSFileManager defaultManager] fileExistsAtPath:gimpPath])
            showMsg(@"Support files installed!");
        return YES;
        NSString *gimpMsg = [NSString stringWithFormat:@"Gimp was supposed to be found here: %@", gimpPath];
        showMsg(gimpMsg);
        [self sayBye];
        return NO;
    }
    if ([psd2htmlArgs count] == 0) {
        NSLog(@"Photoshop & Gimp are installed");
        psd2htmlPath = [[NSBundle mainBundle] pathForResource:@"psd2html-4.0-engine" ofType:@"app"];
        psd2htmlArgs = [NSMutableArray arrayWithObject:[NSString stringWithFormat:@"-a%@", psd2htmlPath]];
        filePaths = [NSMutableArray array];
        return YES;
    } else
        return NO;
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{   
    // Receives the drag and drop event
    return [self queueFile:filename];
}

- (BOOL)queueFile:(NSString *)file
{
    [self ensureReadyState];
    
    NSLog(@"The following file has been queued: %@", file);
    
    // We could do things like make sure the file is real here,
    // preventing things that might fail in the applescript...

    // Most importantly, let's make a temporary copy of the psd.
    NSString *opFile = [file stringByReplacingOccurrencesOfString:@".psd" withString:@"-psd2html.psd"];

    showMsg(@"Writing object files");
    
    [[NSTask launchedTaskWithLaunchPath:@"/bin/cp" arguments:[NSArray arrayWithObjects:file, opFile, nil]] waitUntilExit];
    
    [filePaths addObject:opFile];
    return YES;
}

- (void) processQueue
{
    NSLog(@"Queue has this many files: %lu", [filePaths count]);
    NSLog(@"Will now process the queue.");  
    
    int psdcount = (int)[filePaths count]; // First argument is just "-a", so subtract one
    if (psdcount == 0) {
        NSLog(@"No files in the queue--will quit.");
        showMsg(@"Nothing to convert. (Must drag & drop onto the app icon)");
        
        [self performSelector:@selector(sayBye) withObject:nil afterDelay:2.0];
    } else {
        
        showMsg(([NSString stringWithFormat:@"Converting %d PSDs to HTML", psdcount]));
        
        [progressMeter startAnimation:self];
        
        NSLog(@"There are %lu PSDs in the queue: %@", 
              [filePaths count], [filePaths componentsJoinedByString:@" "]);
        
        [psd2htmlArgs addObjectsFromArray:filePaths];
        
        // Start psd2html-4.0-engine.app with the file list
        // -----------------------------
        [NSTask launchedTaskWithLaunchPath:@"/usr/bin/open" arguments:psd2htmlArgs];
        // ------------------------------
        
        NSLog(@"Launched psd2html-engine.app with the args! w00t");        
        // start the checkTask timer, given enough time for things to start...
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:10];
    }
}

- (void) checkTask {
    if (isRunning(@"psd2html-4.0-engine")) {       
        NSLog(@"Task IS running, what's the current item, do we have insight into the behavior of the subtask? Will check if it's running again soon.");
        // So we may want to implement some AppleScript event listeners
        // the script can then send messages to THIS program, informing it of
        // what file we're working on. (See NSAppleEventDescriptor)
        // This app can then do whatever with it (e.g. remove it from a UITableView)
        
        // Idea: in the meanwhile, we COULD query what stage we're at
        // by using isProcessRunning against the Decrufter, X11, and Reshuffler
        
        if (isRunning(@"Decrufter") || isRunning(@"Photoshop")) {
            showMsg(@"Decrufting...");
        } else if isRunning(@"Reshuffler") {
            showMsg(@"Reshuffling...");
        } else if isRunning(@"python-fu-psd2html") {
            showMsg(@"Generating...");
        } else {
            showMsg(@"In process...");
        }
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:5];

    } else
        [self sayBye];
}

-(void) sayBye {
    NSLog(@"Quitting now!");
    [progressMeter stopAnimation:self];
    if ([filePaths count] > 0) {
        NSLog(@"There are files to delete");
        showMsg(@"Finished! Shutting down.");        
        [[NSTask launchedTaskWithLaunchPath:@"/bin/rm" arguments:filePaths] waitUntilExit];
    }
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:2.5];
}

@end
