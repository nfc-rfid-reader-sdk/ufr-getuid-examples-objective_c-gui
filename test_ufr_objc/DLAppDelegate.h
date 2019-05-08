//
//  DLAppDelegate.h
//  test_ufr_objc
//
//  Created by srkos on 3/13/15.
//  Copyright (c) 2015 D-LOGIC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DLAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *eLog;

-(IBAction)bReaderOpen: (id)sender;
-(IBAction)bReaderClose: (id)sender;

-(IBAction)bGetCardUID: (id)sender;

-(void)updateTextWithMsg: (const char *) msg;

@end
