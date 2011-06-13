//
//  VideoPlayerAppDelegate.m
//  VideoPlayer
//
//  Created by Jeremy Debate on 5/31/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import "VideoPlayerAppDelegate.h"

@implementation VideoPlayerAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL autoPlay, loopVideo, enableControls, fillsScreen, enableAirplay;    
    
    // Configure our video player
    autoPlay = YES;            // Automatically start video playback (local videos always auto-play)
	loopVideo = YES;           // Loop the video
	enableControls = YES;      // Allow the user to control 
	fillsScreen = NO;          // Force the video to fill the entire window
    enableAirplay = YES;       // Allow the video to be streamed to an AppleTV
	
    
    // The URL of the video we wish to play. Can be a local file, or an HTTP stream
	// In this example, the video we want to play is bundled with the application
	NSString *fileName = @"EaseDemo";
	NSString *fileType = @"mov";
	NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:fileType]];
    
	// -
	
    // Create our movie player view controller
    movieViewController_ = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
	
	
    // Configure the movie player view controller based on the configuration variables provided above
    movieViewController_.moviePlayer.repeatMode = loopVideo ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
	movieViewController_.moviePlayer.scalingMode = fillsScreen ? MPMovieScalingModeAspectFill : MPMovieScalingModeAspectFit;
	movieViewController_.moviePlayer.controlStyle = enableControls ? MPMovieControlStyleFullscreen : MPMovieControlStyleNone;
    movieViewController_.moviePlayer.shouldAutoplay = autoPlay;
	
    // As AirPlay support is only available in iOS 4.3, make sure it is available
    if ([movieViewController_.moviePlayer respondsToSelector:@selector(allowsAirPlay)])
        [movieViewController_.moviePlayer performSelector:@selector(setAllowsAirPlay:) withObject:[NSNumber numberWithBool:YES]];
    
	
    // Display our window
    [self.window setRootViewController:movieViewController_];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
