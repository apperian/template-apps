//
//  DocViewerAppDelegate.h
//  DocViewer
//
//  Created by Jeremy Debate on 5/26/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocViewerViewController.h"

@interface DocViewerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DocViewerViewController *docViewController;

@end
