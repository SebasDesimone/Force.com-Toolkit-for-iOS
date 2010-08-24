//
//  SplitForceAppDelegate.m
//  SplitForce
//
//  Created by Dave Carroll on 6/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SVNTestAppDelegate.h"


#import "RootViewController.h"
#import "DetailViewController.h"
#import "LoginViewController.h"


@implementation SVNTestAppDelegate

@synthesize window, splitViewController, rootViewController, detailViewController;
@synthesize loginViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
	loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
	
	BOOL showError = NO;
	NSString *errorMsg;
	
    // Add the split view controller's view to the window and display.
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
    
	[self showLogin];
	
	if (showError) {
		[self popupActionSheet:errorMsg];
	}
    return YES;
}

- (void)showLogin {
	loginViewController.modalPresentationStyle = UIModalPresentationFormSheet;
	[splitViewController presentModalViewController:loginViewController animated:YES];
}

- (void)hideLogin {
	[splitViewController dismissModalViewControllerAnimated:YES];
}

-(void)popupActionSheet:(NSString *)message {
    UIActionSheet *popupQuery = [[UIActionSheet alloc]
								 initWithTitle:@"Unexpected Error"
								 delegate:rootViewController
								 cancelButtonTitle:@"OK"
								 destructiveButtonTitle:nil
								 otherButtonTitles:nil];
	
	[popupQuery setMessage:message];
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:loginViewController.view];
	[popupQuery release];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end

