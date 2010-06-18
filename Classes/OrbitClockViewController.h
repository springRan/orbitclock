//
//  OrbitClockViewController.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/6/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Orbiter.h"
#import "Indicators.h"
#import "InfoViewController.h"

@interface OrbitClockViewController : UIViewController <UIPopoverControllerDelegate, InfoViewControllerDelegate> {
	
	InfoViewController *infoView;
	UIPopoverController *infoViewPopover;
	
	IBOutlet UIButton *info_button;
	
	Orbiter *center_hand;
	Orbiter *hour_hand;
	Orbiter *minute_hand;
	Orbiter *second_hand;
	Orbiter *centisecond_hand;
	
	Indicators *indicators;
	
	NSTimer *timer;
	
	double hour;
	double minute;
	double second;
	double centisecond;
	
	NSUserDefaults *prefs;
	
}

@property (nonatomic, retain) InfoViewController *infoView;
@property (nonatomic, retain) UIPopoverController *infoViewPopover;

@property (nonatomic, retain) IBOutlet UIButton *info_button;

@property (nonatomic, retain) Orbiter *center_hand;
@property (nonatomic, retain) Orbiter *hour_hand;
@property (nonatomic, retain) Orbiter *minute_hand;
@property (nonatomic, retain) Orbiter *second_hand;
@property (nonatomic, retain) Orbiter *centisecond_hand;

@property (nonatomic, retain) Indicators *indicators;

@property (nonatomic, retain) NSTimer *timer;

@property (readwrite, assign) double hour;
@property (readwrite, assign) double minute;
@property (readwrite, assign) double second;
@property (readwrite, assign) double centisecond;

@property (nonatomic, assign) NSUserDefaults *prefs;

- (IBAction)showInfo:(id)sender;

- (void)startTimer;
- (void)setTime;

@end