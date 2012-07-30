//
//  ALAppDelegate.h
//  PomodoroMinima
//
//  Created by Delyan Raychev on 7/29/12.
//  Copyright (c) 2012 Accent Labs. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ALAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu* statusMenu;
    NSStatusItem* statusItem;
    NSImage* statusImageOn;
    NSImage* statusImageOff;
    int secondsCountDown;
}

- (IBAction)startPomodoro:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
