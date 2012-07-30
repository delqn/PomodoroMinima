//
//  ALAppDelegate.m
//  PomodoroMinima
//
//  Created by Delyan Raychev on 7/29/12.
//  Copyright (c) 2012 Accent Labs. All rights reserved.
//

#import "ALAppDelegate.h"

@implementation ALAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)awakeFromNib{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    NSBundle* bundle = [NSBundle mainBundle];
    statusImageOn = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"tomato-on" ofType:@"png"]];
    statusImageOff = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"tomato-off" ofType:@"png"]];
    [statusItem setImage:statusImageOff];
    [statusItem setMenu:statusMenu];
    //[statusItem setTitle:@"Pomodoro"];
    [statusItem setHighlightMode:YES];
}

- (IBAction)startPomodoro:(id)sender {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advanceTimer:) userInfo:nil repeats:YES];
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    secondsCountDown = 25*60;
    [statusItem setTitle:@"25:00"];
    [statusItem setImage:statusImageOn];
}

- (void)advanceTimer:(NSTimer*) timer{
    secondsCountDown--;
    [statusItem setTitle:[NSString stringWithFormat:@"%i:%i", secondsCountDown/60, secondsCountDown%60]];
    if (secondsCountDown<=0){
        [statusItem setTitle:@"Done!"];
        [timer invalidate];
        timer = nil;
        [statusItem setImage:statusImageOff];
    }
}

@end
