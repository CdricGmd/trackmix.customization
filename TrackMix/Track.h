//
//  Track.h
//  TrackMix
//
//  Created by Cédric Golmard on 25/07/13.
//  Copyright (c) 2013 Cédric Golmard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
{
    NSSound *my_sound;
}
@property (assign) float volume;

-(id) init;
-(void)loadSoundFile:(NSURL*)new_file;
-(void)updateVolume:(float)new_volume;

@end
