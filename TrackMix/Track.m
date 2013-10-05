//
//  Track.m
//  TrackMix
//
//  Created by Cédric Golmard on 25/07/13.
//  Copyright (c) 2013 Cédric Golmard. All rights reserved.
//

#import "Track.h"

@implementation Track

-(id) init{
    //NSSound *my_sound = [[NSSound alloc] initWithContentsOfFile:NULL byReference:YES];
    //NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    //NSString *sound_file = [thisBundle pathForResource:@"21turnover" ofType:@"wav"];
    //[self loadSoundFile:sound_file];
    [self updateVolume:5];
    NSLog(@"Init volume value to %1.2f", self.volume);
    return self;
    //init NSDocumentController
}

-(void)loadSoundFile:(NSURL*)new_file_url{
    [my_sound stop];
    NSLog(@"Loading file : %@", new_file_url);
    my_sound = [[NSSound alloc] initWithContentsOfURL:new_file_url byReference:YES];
    NSLog(@"Playing file : %@", new_file_url);
    [my_sound play];
    [self updateVolume:self.volume];
}

-(void)updateVolume:(float)new_volume{
    self.volume = new_volume;
    [my_sound setVolume:(new_volume/11)]; //NSSound volume is defined on a 0.0-1.0 float range
}


@end
