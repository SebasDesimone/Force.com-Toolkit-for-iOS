//
//  LoginViewController.h
//  SplitForce
//
//  Created by Dave Carroll on 6/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zkSforce.h"
#import "RootViewController.h"

@interface LoginViewController : UIViewController  {    
	UITextField *txtUsername;
	UITextField	*txtPassword;
}

@property (nonatomic, retain) IBOutlet UITextField *txtUsername;
@property (nonatomic, retain) IBOutlet UITextField *txtPassword;

-(IBAction)callLogin:(id)sender;
@end

