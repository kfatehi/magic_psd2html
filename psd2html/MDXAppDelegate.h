//
//  MDXAppDelegate.h
//  psd2html
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MDXHelper.h"

@interface MDXAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSString *psd2htmlPath;
@property (nonatomic, retain) NSMutableArray *psd2htmlArgs;
@property (weak) IBOutlet NSTextField *mainLabel;
@property (weak) IBOutlet NSProgressIndicator *progressMeter;

- (void) ensureInitialArgumentList;
- (NSString *) escapeWhitespace:(NSString *)path;
- (BOOL)queueFile:(NSString *)file;
- (void) processQueue;
- (void) checkTask;

@end
