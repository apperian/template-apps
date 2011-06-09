//
//  DocViewerViewController.m
//  DocViewer
//
//  Created by Jeremy Debate on 5/26/11.
//  Copyright 2011 Apperian. All rights reserved.
//

#import "DocViewerViewController.h"

@implementation DocViewerViewController
@synthesize docWebView=docWebView_;
@synthesize navigationBar=navigationBar_;
@synthesize navigationItem=navigationItem_;
@synthesize shareButton=shareButton_;

@synthesize barTintColor=barTintColor_;

@synthesize printingEnabled=printingEnabled_;

@synthesize fileURL=fileURL_;
@synthesize fileDisplayName=fileDisplayName_;


#pragma Interface Builder actions

- (IBAction)share:(UIBarButtonItem*)sender {
    [docInteractionController_ dismissMenuAnimated:NO];
    [docInteractionController_ presentOptionsMenuFromBarButtonItem:sender animated:YES];
}


#pragma UIDocumentInteractionControllerDelegate

- (BOOL) documentInteractionController:(UIDocumentInteractionController *)controller canPerformAction:(SEL)action {

    if (action == @selector(print:) && [UIPrintInteractionController canPrintURL:controller.URL] && self.printingEnabled) {
        return YES;
    } else {
        return NO;
    }
    
    return NO;
}

- (BOOL) documentInteractionController:(UIDocumentInteractionController *)controller performAction:(SEL)action {
    
    if (action == @selector(print:) && [UIPrintInteractionController canPrintURL:controller.URL] && self.printingEnabled) {
        [[UIPrintInteractionController sharedPrintController] setPrintingItem:fileURL_];
        [[UIPrintInteractionController sharedPrintController] presentFromBarButtonItem:shareButton_ animated:YES completionHandler:nil];
        return YES;
    }
    
    return NO;
}

#pragma ViewController life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize our document interaction controller
    docInteractionController_ = [[UIDocumentInteractionController alloc] init];
    docInteractionController_.delegate = self;
    docInteractionController_.name = self.fileDisplayName;
    docInteractionController_.URL = fileURL_;
    
    if (self.fileDisplayName)
        navigationItem_.title = self.fileDisplayName;
    else
        navigationItem_.title = [self.fileURL lastPathComponent];
    
    if (self.barTintColor)
        navigationBar_.tintColor = self.barTintColor;
    
    if (!self.printingEnabled)
        navigationItem_.rightBarButtonItem = nil;
    
    [docWebView_ loadRequest:[NSURLRequest requestWithURL:fileURL_]];
}

- (void)viewDidUnload
{
    [self setDocWebView:nil];
    [self setNavigationBar:nil];
    [self setShareButton:nil];
    [self setNavigationItem:nil];
    [super viewDidUnload];
}

- (void)dealloc
{
    [barTintColor_ release];
    [docInteractionController_ release];
    [fileURL_ release];
    [fileDisplayName_ release];
    [docWebView_ release];
    [navigationBar_ release];
    [shareButton_ release];
    [navigationItem_ release];
    [super dealloc];
}


#pragma mark Miscellaneous

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone && toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        return NO;
    
    return YES;
}


@end
