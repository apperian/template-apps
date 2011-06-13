//
//  VideoPlayerAppDelegate.h
//  VideoPlayer
//
//  Created by Jeremy Debate on 5/31/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoPlayerAppDelegate : NSObject <UIApplicationDelegate> {

    MPMoviePlayerViewController *movieViewController_;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
