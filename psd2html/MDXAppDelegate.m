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
@synthesize psd2htmlPath;
@synthesize psd2htmlArgs;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"Startup");
    [self ensureReadyState];
    // Wait a bit, make sure we've filled our set of PSDs...
    // Then launch psd2html-jsilver.app
    [self performSelector:@selector(processQueue) withObject:nil afterDelay:2.0];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{   
    // Receives the drag and drop event
    return [self queueFile:filename];
}

- (void) ensureReadyState {
    // Consider this the entry point into the application.
    // This method gets called once and only once per launch at the very start.
    
    // TODO: This is a good time to do a pre-flight check for Adobe Photoshop,
    // if it is not installed we should stop immediately.
    
    if ([psd2htmlArgs count] < 1) {
        psd2htmlPath = [[NSBundle mainBundle] pathForResource:@"psd2html-jsilver" ofType:@"app"];
        psd2htmlArgs = [NSMutableArray arrayWithObject:[NSString stringWithFormat:@"-a%@", psd2htmlPath]];
    }
}

- (NSString *) escapeWhitespace:(NSString *)path {
    return [path stringByReplacingOccurrencesOfString:@" " withString:@"\\ "];
}

- (BOOL)queueFile:(NSString *)file
{
    [self ensureReadyState];
    NSString *psdPath = [self escapeWhitespace:file];
    NSLog(@"The following file has been queued: %@",psdPath);
    
    // We could do things like make sure the file is real here,
    // preventing things that might fail in the applescript...

    // More importantly, let's duplicate the input file
    
    
    [psd2htmlArgs addObject:file];
    return YES;
}

- (void) processQueue
{
    NSLog(@"Queue has this many files: %lu", [psd2htmlArgs count]-1);
    NSLog(@"Will now process the queue.");  
    
    isRunning(@"psd2html-jsilver");
    //[MDXHelper isProcessRunning:@"psd2html"];
    
    int psdcount = [psd2htmlArgs count] -1; // First argument is just "-a", so subtract one
    if (psdcount == 0) {
        NSLog(@"No files in the queue--will quit.");
        [mainLabel setStringValue:@"Nothing to convert. (Must drag & drop onto the app icon)"];
        [self performSelector:@selector(sayBye) withObject:nil afterDelay:2.0];
    } else {
        [mainLabel setStringValue:[NSString stringWithFormat:@"Starting subordinate process chains (whipping elves) for %d PSDs", psdcount]];
        [progressMeter startAnimation:self];
        
        NSLog(@"There are %lu PSDs in the queue: %@", 
              [psd2htmlArgs count], [psd2htmlArgs componentsJoinedByString:@" "]);
        
        // Send the launch command
        [NSTask launchedTaskWithLaunchPath:@"/usr/bin/open" arguments:psd2htmlArgs];
        NSLog(@"Launched psd2html-jsilver.app with the args! w00t");        
        // start the checkTask timer, given enough time for things to start...
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:10];
    }
}

- (void) checkTask {
    if (isRunning(@"psd2html-jsilver")) {       
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
    showMsg(@"No PSDs left to process. Goodbye.");
    [progressMeter stopAnimation:self];
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:1.0];
}

@end
