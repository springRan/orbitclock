//
//  Orbit_ClockViewController_iPad.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsViewController.h"
#import "ClockViewController.h"

#define CLOCK_SIZE CGSizeMake(768.0, 768.0)
#define VIEW_CENTER_PORTRAIT CGPointMake(384.0, 502.0)
#define VIEW_CENTER_LANDSCAPE CGPointMake(512.0, 374.0)

@interface Orbit_ClockViewController_iPad : UIViewController <OptionsViewControllerDelegate> {
	NSUserDefaults *prefs;
	OptionsViewController *options_view;
	ClockViewController *clock_view;
	UIPopoverController *options_view_popover;
	IBOutlet UIButton *options_button;
}

@property (nonatomic, assign) NSUserDefaults *prefs;
@property (nonatomic, retain) OptionsViewController *options_view;
@property (nonatomic, retain) ClockViewController *clock_view;
@property (nonatomic, retain) UIPopoverController *options_view_popover;
@property (nonatomic, retain) IBOutlet UIButton *options_button;

- (IBAction)showOptions:(id)sender;

@end
