//
//  AppDelegate.h
//  TrackMix
//
//  Created by Cédric Golmard on 25/07/13.
//  Copyright (c) 2013 Cédric Golmard. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Track;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSSlider *slider;
@property (strong) Track *track;

- (IBAction)mute:(id)sender;
- (IBAction)takeFloatValueForVolumeFrom:(id)sender;
- (void)updateUserInterface;
- (IBAction)openDocument:(id)sender;

@end
