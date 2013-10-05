//
//  AppDelegate.m
//  TrackMix
//
//  Created by Cédric Golmard on 25/07/13.
//  Copyright (c) 2013 Cédric Golmard. All rights reserved.
//

#import "AppDelegate.h"
#import "Track.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    Track *aTrack = [[Track alloc] init];
    self.track = aTrack; // equivalent to [self setTrack:aTrack];
    [self updateUserInterface];
}

- (IBAction)mute:(id)sender {
    NSLog(@"received a mute : message");
    [self.track updateVolume:0.0];
    [self updateUserInterface];
}

- (IBAction)takeFloatValueForVolumeFrom:(id)sender {
    float newValue = [sender floatValue];
    NSString *senderName = nil;
    //self.track.volume = newValue; // [self.track setVolume:newValue];
    [self.track updateVolume:newValue];
    
    if (sender == self.textField) {
        senderName = @"textField";
    } else {
        senderName = @"slider";
    }
    NSLog(@"%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, newValue);
    
    [self updateUserInterface];
}

// Update and synchronize user interface
- (void)updateUserInterface {
    float volume = [self.track volume];
    
    [self.textField setFloatValue:volume];
    [self.slider setFloatValue:volume];
}

- (IBAction)openDocument:(id)sender {
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    NSArray* soundTypes = [NSSound soundUnfilteredTypes];
    [panel setAllowedFileTypes:soundTypes];
    // This method displays the panel and returns immediately.
    // The completion handler is called when the user selects an
    // item or cancels the panel.
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[panel URLs] objectAtIndex:0];
            
            // Open  the document.
            [self.track loadSoundFile:theDoc];
        }
    }];
}
@end
