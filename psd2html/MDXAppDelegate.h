//
//  MDXAppDelegate.h
//  The Magic PSD to HTML Converter
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 MDX Research Labs All rights reserved.
//
//  psd2html-4.0-engine.app by Jonathan Silverman

#import <Cocoa/Cocoa.h>
#import "MDXHelper.h"

#define showMsg(msg) ([mainLabel setStringValue:msg])

@interface MDXAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSString *psd2htmlPath;
@property (nonatomic, retain) NSMutableArray *filePaths;
@property (nonatomic, retain) NSMutableArray *psd2htmlArgs;
@property (nonatomic, retain) IBOutlet NSTextField *mainLabel;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progressMeter;

- (BOOL) ensureReadyState;
- (BOOL) queueFile:(NSString *)file;
- (void) processQueue;
- (void) checkTask;
- (void) sayBye;

@end
