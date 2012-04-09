//
//  MDXAppDelegate.m
//  psd2html
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

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
    NSLog(@"Startup");
    [self ensureReadyState];
    // Wait a bit, make sure we've filled our set of PSDs...
    // Then launch psd2html-jsilver.app
    [self performSelector:@selector(processQueue) withObject:nil afterDelay:2.0];
}

- (void) ensureReadyState {
    // Consider this the entry point into the application.
    // This method gets called once and only once per launch at the very start.
    
    // TODO: This is a good time to do a pre-flight check for Adobe Photoshop,
    // if it is not installed we should stop immediately.
    
    if ([psd2htmlArgs count] == 0) {
        psd2htmlPath = [[NSBundle mainBundle] pathForResource:@"psd2html-4.0-jsilver" ofType:@"app"];
        psd2htmlArgs = [NSMutableArray arrayWithObject:[NSString stringWithFormat:@"-a%@", psd2htmlPath]];
        filePaths = [NSMutableArray array];
    }
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

    // TODO: More importantly, let's duplicate the input file
    NSString *opFile = [[file stringByAppendingPathExtension:@"psd2html"] stringByAppendingPathExtension:@".psd"];

    showMsg(@"Writing object files");
    
    [[NSTask launchedTaskWithLaunchPath:@"/bin/cp" arguments:[NSArray arrayWithObjects:file, opFile, nil]] waitUntilExit];
    
    [filePaths addObject:opFile];
    return YES;
}

- (void) processQueue
{
    NSLog(@"Queue has this many files: %lu", [filePaths count]);
    NSLog(@"Will now process the queue.");  
    
    int psdcount = [filePaths count]; // First argument is just "-a", so subtract one
    if (psdcount == 0) {
        NSLog(@"No files in the queue--will quit.");
        showMsg(@"Nothing to convert. (Must drag & drop onto the app icon)");
        
        [self performSelector:@selector(sayBye) withObject:nil afterDelay:2.0];
    } else {
        
        showMsg(([NSString stringWithFormat:@"Starting subordinate process chains (whipping elves) for %d PSDs", psdcount]));
        
        [progressMeter startAnimation:self];
        
        NSLog(@"There are %lu PSDs in the queue: %@", 
              [filePaths count], [filePaths componentsJoinedByString:@" "]);
        
        [psd2htmlArgs addObjectsFromArray:filePaths];
        
        // Start psd2html-4.0-jsilver.app with the file list
        // -----------------------------
        [NSTask launchedTaskWithLaunchPath:@"/usr/bin/open" arguments:psd2htmlArgs];
        // ------------------------------
        
        NSLog(@"Launched psd2html-jsilver.app with the args! w00t");        
        // start the checkTask timer, given enough time for things to start...
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:10];
    }
}

- (void) checkTask {
    if (isRunning(@"psd2html-4.0-jsilver")) {       
        NSLog(@"Task IS running, what's the current item, do we have insight into the behavior of the subtask? Will check if it's running again soon.");
        // So we may want to implement some AppleScript event listeners
        // the script can then send messages to THIS program, informing it of
        // what file we're working on. (See NSAppleEventDescriptor)
        // This app can then do whatever with it (e.g. remove it from a UITableView)
        
        // Idea: in the meanwhile, we COULD query what stage we're at
        // by using isProcessRunning against the Decrufter, X11, and Reshuffler
        
        if (isRunning(@"Decrufter") || isRunning(@"Photoshop")) {
            showMsg(@"Meticulously removing tricky, sticky cruft from the PSD...");
        } else if isRunning(@"Reshuffler") {
            showMsg(@"Applying magical DOM reshuffling spices...");
        } else if isRunning(@"python-fu-psd2html") {
            showMsg(@"Converting... Make sure to click through any dialogs.");
        } else {
            showMsg(@"In process... Make sure to click through any dialogs.");
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
        showMsg(@"Cleaning up temporary files & shutting down.");        
        [[NSTask launchedTaskWithLaunchPath:@"/bin/rm" arguments:filePaths] waitUntilExit];
        
    }
    [NSApp terminate:nil];
}

@end
