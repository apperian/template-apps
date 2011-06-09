//
//  DocViewerAppDelegate.m
//  DocViewer
//
//  Created by Jeremy Debate on 5/25/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import "DocViewerAppDelegate.h"
#import "DocViewerViewController.h"

@implementation DocViewerAppDelegate

@synthesize window=window_;
@synthesize docViewController=docViewController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	BOOL printingEnabled;
	UIColor *barTintColor = nil;    
    
    // Configure our document viewer
    printingEnabled = YES;                    // Enable the "Print" action
	barTintColor = [UIColor orangeColor];     // The tint color for our header UINavigationBar

	// The file we want to display
	NSString *fileName = @"mobility_transformed";
	NSString *fileType = @"pdf";
	NSString *fileDisplayName = @"Mobility Transformed";
	
	// -
	
    // Configure the document viewer view controller based on the configuration variables provided above
	docViewController_.fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:fileType]];
    docViewController_.fileDisplayName = fileDisplayName;
    docViewController_.printingEnabled = YES;
	if (barTintColor)
		docViewController_.barTintColor = barTintColor;
    
    
    // Display our window
    [self.window setRootViewController:docViewController_];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc
{
    [window_ release];
    [docViewController_ release];
    [super dealloc];
}

@end
