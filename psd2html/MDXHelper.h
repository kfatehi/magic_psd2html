//
//  MDXHelper.h
//  psd2html
//
//  Created by Keyvan Fatehi on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isRunning(process) ([MDXHelper isProcessRunning:process]) // Like a boss

@interface MDXHelper

+ (BOOL) isProcessRunning: (NSString *)processName; // Class method

@end
