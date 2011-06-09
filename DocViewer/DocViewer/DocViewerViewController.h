//
//  DocViewerViewController.h
//  DocViewer
//
//  Created by Jeremy Debate on 5/26/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocViewerViewController : UIViewController <UIDocumentInteractionControllerDelegate> {
    
    UIWebView*                       docWebView_;
    UINavigationBar*                 navigationBar_;
    UINavigationItem*                navigationItem_;
    UIBarButtonItem*                 shareButton_;
    
    UIColor*                         barTintColor_;
    
    BOOL                             printingEnabled_;
    
    NSString*                        fileDisplayName_;
    
    @private
    UIDocumentInteractionController* docInteractionController_;
    NSURL*                           fileURL_;
}

@property (nonatomic, retain) IBOutlet UIWebView *docWebView;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *shareButton;

@property (nonatomic, copy) UIColor *barTintColor;

@property (nonatomic, copy) NSURL *fileURL;
@property (nonatomic, copy) NSString *fileDisplayName;

@property BOOL printingEnabled;

- (IBAction)share:(UIBarButtonItem*)sender;

@end
