//
//  Orbit_ClockViewController_iPhone.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockViewController.h"
#import "OptionsViewController.h"

#define CLOCK_SIZE CGSizeMake(320.0, 320.0)
#define VIEW_CENTER_PORTRAIT CGPointMake(160.0, 230.0)
#define VIEW_CENTER_LANDSCAPE CGPointMake(240.0, 150.0)

@interface Orbit_ClockViewController_iPhone : UIViewController <OptionsViewControllerDelegate> {
	
	NSUserDefaults *prefs;
	IBOutlet UIButton *info_button;
	ClockViewController *clock_view;
	
}

@property (nonatomic, assign) NSUserDefaults *prefs;
@property (nonatomic, retain) IBOutlet UIButton *info_button;
@property (nonatomic, retain) ClockViewController *clock_view;

- (IBAction)showInfo:(id)sender;

@end
