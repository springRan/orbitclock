//
//  InfoViewController.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewControllerDelegate <NSObject>

- (void)indicatorsChanged:(BOOL)value;
- (void)centisecondsChanged:(BOOL)value;

@end

@interface InfoViewController : UIViewController {
	IBOutlet UISwitch *indicatorSwitch;
	IBOutlet UISwitch *centisecondSwitch;
	int indicatorsVisible;
	int centisecondsVisible;
	id delegate;
}

@property (nonatomic, retain) IBOutlet UISwitch *indicatorSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *centisecondSwitch;
@property (nonatomic, assign) int indicatorsVisible;
@property (nonatomic, assign) int centisecondsVisible;
@property (nonatomic, assign) id <InfoViewControllerDelegate> delegate;

- (IBAction)toggleIndicators:(id)sender;
- (IBAction)toggleCentiseconds:(id)sender;

@end