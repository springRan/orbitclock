//
//  ClockViewController.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockView.h"

@interface ClockViewController : UIViewController {
	NSDate *clock_time;
	NSTimer *timer;
	double centiseconds;
}

@property (nonatomic, retain) NSDate *clock_time;
@property (nonatomic, retain) NSTimer *timer;
@property (readwrite, assign) double centiseconds;

- (void)setTime:(NSDate *)time;
- (void)drawTime;
- (void)showCenterIndicator:(BOOL)visible;
- (void)showHourIndicators:(BOOL)visible;
- (void)showSeconds:(BOOL)visible;
- (void)showCentiseconds:(BOOL)visible;

@end
