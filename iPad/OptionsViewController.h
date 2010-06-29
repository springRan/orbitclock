//
//  OptionsViewController.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OptionsViewControllerDelegate <NSObject>

- (void)indicatorsChanged:(BOOL)value;
- (void)centisecondsChanged:(BOOL)value;
- (void)optionsViewControllerDidFinish;

@end

@interface OptionsViewController : UIViewController {
	IBOutlet UISwitch *indicator_switch;
	IBOutlet UISwitch *centisecond_switch;
	int indicators_visible;
	int centiseconds_visible;
	id delegate;
}

@property (nonatomic, retain) IBOutlet UISwitch *indicator_switch;
@property (nonatomic, retain) IBOutlet UISwitch *centisecond_switch;
@property (nonatomic, assign) int indicators_visible;
@property (nonatomic, assign) int centiseconds_visible;
@property (nonatomic, assign) id <OptionsViewControllerDelegate> delegate;

- (IBAction)toggleIndicators:(id)sender;
- (IBAction)toggleCentiseconds:(id)sender;

@end