//
//  OptionsViewController.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OptionsViewControllerDelegate <NSObject>

- (void)showCenterIndicator:(BOOL)visible;
- (void)showHourIndicators:(BOOL)visible;
- (void)showSeconds:(BOOL)visible;
- (void)showCentiseconds:(BOOL)visible;
- (void)optionsViewControllerDidFinish;

@end

@interface OptionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UIButton *link;
	IBOutlet UISwitch *center_indicator_switch;
	IBOutlet UISwitch *hour_indicators_switch;
	IBOutlet UISwitch *seconds_switch;
	IBOutlet UISwitch *centiseconds_switch;
	BOOL center_indicator_visible;
	BOOL hour_indicators_visible;
	BOOL seconds_visible;
	BOOL centiseconds_visible;
	id delegate;
}

@property (nonatomic, retain) IBOutlet UIButton *link;
@property (nonatomic, retain) IBOutlet UISwitch *center_indicator_switch;
@property (nonatomic, retain) IBOutlet UISwitch *hour_indicators_switch;
@property (nonatomic, retain) IBOutlet UISwitch *seconds_switch;
@property (nonatomic, retain) IBOutlet UISwitch *centiseconds_switch;
@property (readwrite, assign) BOOL center_indicator_visible;
@property (readwrite, assign) BOOL hour_indicators_visible;
@property (readwrite, assign) BOOL seconds_visible;
@property (readwrite, assign) BOOL centiseconds_visible;
@property (nonatomic, assign) id <OptionsViewControllerDelegate> delegate;

- (IBAction)linkToHomePage:(id)sender;
- (IBAction)showCenterIndicator:(id)sender;
- (IBAction)showHourIndicators:(id)sender;
- (IBAction)showSeconds:(id)sender;
- (IBAction)showCentiseconds:(id)sender;
- (IBAction)done:(id)sender;

@end