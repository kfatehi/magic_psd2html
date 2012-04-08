//
//  MDXAppDelegate.m
//  psd2html
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MDXAppDelegate.h"

@implementation MDXAppDelegate
@synthesize mainLabel;
@synthesize progressMeter;
@synthesize psd2htmlPath;
@synthesize psd2htmlArgs;
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"Startup");
    [self ensureInitialArgumentList];
    // Wait a bit, make sure we've filled our set of PSDs...
    // Then launch psd2html-jsilver.app
    [self performSelector:@selector(processQueue) withObject:nil afterDelay:2.0];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
    // Receives the drag and drop event
    return [self queueFile:filename];
}

- (void) ensureInitialArgumentList {
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
    [self ensureInitialArgumentList];
    NSString *psdPath = [self escapeWhitespace:file];
    NSLog(@"The following file has been queued: %@",psdPath);
    // We could do things like make sure the file is real here,
    // preventing things that might fail in the applescript...
    [psd2htmlArgs addObject:file];
    return YES;
}

- (void) processQueue
{
    NSLog(@"Queue has this many files: %lu", [psd2htmlArgs count]-1);
    NSLog(@"Will now process the queue.");

    [MDXHelper isProcessRunning:@"iTerm"];
    [MDXHelper isProcessRunning:@"psd2html-jsilver"];
    
    
    int psdcount = [psd2htmlArgs count] -1; // First argument is just "-a", so subtract one
    if (psdcount == 0) {
        NSLog(@"No files in the queue--will quit.");
        [mainLabel setStringValue:@"Nothing to convert. (Must drag & drop onto the app icon)"];
        [self performSelector:@selector(sayBye) withObject:nil afterDelay:2.0];
    } else {
        [mainLabel setStringValue:[NSString stringWithFormat:@"Starting subordinate process chains (whipping elves) for %d PSDs", psdcount]];
        [progressMeter startAnimation:self];
        // Prepare the arguments
        NSLog(@"Current file list: ");
        for (NSString *filepath in psd2htmlArgs) {
            NSLog(@" --  %@", filepath);
        }
        // Send the launch command
        [NSTask launchedTaskWithLaunchPath:@"/usr/bin/open" arguments:psd2htmlArgs];
        NSLog(@"Launched psd2html-jsilver.app with the args! w00t");        
        // start the checkTask timer
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:5];
    }
}

- (void) checkTask {
    int status = system("ps ax | grep psd2html-jsilver | grep -v grep | wc -l");
    if ( status == 0 ) { // not running
        // done, say bye and exit
        // also pop the object and inform its completion?
        NSLog(@"Task IS NOT running, what's the current item, do we have insight into the behavior of the subtask?");
        [self sayBye];
    } else {
        // could provide a status update here
        NSLog(@"Task IS running, what's the current item, do we have insight into the behavior of the subtask?");
        [self performSelector:@selector(checkTask) withObject:nil afterDelay:10];
    }
}

-(void) sayBye {
    NSLog(@"Quitting now!");
    [mainLabel setStringValue:@"Quitting app."];
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:1.0];
}

@end
