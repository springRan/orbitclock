//
//  Orbit_ClockViewController_iPad.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"
#import "ClockViewController.h"

@interface Orbit_ClockViewController_iPad : UIViewController <UIPopoverControllerDelegate, InfoViewControllerDelegate> {
	
	NSUserDefaults *prefs;
	InfoViewController *infoView;
	UIPopoverController *infoViewPopover;
	ClockViewController *clockView;
	IBOutlet UIButton *info_button;
	
}

@property (nonatomic, assign) NSUserDefaults *prefs;
@property (nonatomic, retain) InfoViewController *infoView;
@property (nonatomic, retain) UIPopoverController *infoViewPopover;
@property (nonatomic, retain) ClockViewController *clockView;
@property (nonatomic, retain) IBOutlet UIButton *info_button;

- (IBAction)showInfo:(id)sender;

@end
