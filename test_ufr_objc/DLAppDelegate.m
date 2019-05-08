//
//  DLAppDelegate.m
//  test_ufr_objc
//
//  Created by srkos on 3/13/15.
//  Copyright (c) 2015 D-LOGIC. All rights reserved.
//

#import "DLAppDelegate.h"

#import "uFCoder.h"

@implementation DLAppDelegate

@synthesize eLog;

-(void)updateTextWithMsg: (const char *) msg
{
    NSString *nsMsg = [[NSString alloc] initWithBytes:msg length:strlen(msg) encoding:NSASCIIStringEncoding];
    
    [self.eLog setStringValue:nsMsg];
    
    NSLog(@"%@", nsMsg);
    
    //    [nsMsg release];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    char msg_cstr[64];
    sprintf(msg_cstr, "uFCoder lib v.%s", GetDllVersionStr());
    [self updateTextWithMsg:msg_cstr];
}

-(IBAction)bReaderOpen: (id)sender
{
    UFR_STATUS status;
    
    status = ReaderOpen();
    
    char msg_cstr[512];
    
    if (status)
    {
        // error
        
        sprintf(msg_cstr, "Reader Open %s", UFR_Status2String(status));
    }
    else
    {
        // OK
        
        strcpy(msg_cstr, GetReaderDescription());
    }
    
    [self updateTextWithMsg:msg_cstr];
}

-(IBAction)bReaderClose: (id)sender
{
    UFR_STATUS status;
    
    status = ReaderClose();
    
    char msg_cstr[64];
    sprintf(msg_cstr, "Reader Close %s", UFR_Status2String(status));
    [self updateTextWithMsg:msg_cstr];
}

-(IBAction)bGetCardUID:(id)sender
{
    UFR_STATUS status;
    uint8_t uid[10];
    uint8_t CardType;
    uint8_t uidSize;
    
    status = GetCardIdEx(&CardType, uid, &uidSize);
    
    char msg_cstr[64];
   
    if (status)
    {
        // error
        
        sprintf(msg_cstr, "GetCardId %s", UFR_Status2String(status));
    }
    else
    {
        // OK
        sprintf(msg_cstr, "Card UID[%d bytes] = ", uidSize);
        
        for(uint8_t i = 0; i < uidSize; i++)
        {
            char hex[4] = "";
            sprintf(hex, "%02X", uid[i]);
            strcat(msg_cstr, hex);
        }
    }
    
    [self updateTextWithMsg:msg_cstr];
}

@end
