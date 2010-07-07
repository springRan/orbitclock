//
//  ClockView.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrbiterView.h"

#define DEFAULT_HOUR_HAND_ANGLE 0.0
#define DEFAULT_MINUTE_HAND_ANGLE 0.0
#define DEFAULT_SECOND_HAND_ANGLE 0.0
#define DEFAULT_CENTISECOND_HAND_ANGLE 0.0

@interface ClockView : UIView {
	
	double hour_hand_angle;
	double minute_hand_angle;
	double second_hand_angle;
	double centisecond_hand_angle;
	NSMutableArray *indicators;
	NSMutableArray *hands;
	
}

@property (readwrite, assign) double hour_hand_angle;
@property (readwrite, assign) double minute_hand_angle;
@property (readwrite, assign) double second_hand_angle;
@property (readwrite, assign) double centisecond_hand_angle;
@property (nonatomic, retain) NSMutableArray *indicators;
@property (nonatomic, retain) NSMutableArray *hands;

- (void)setHourHandAngle:(double)angle;
- (void)setMinuteHandAngle:(double)angle;
- (void)setSecondHandAngle:(double)angle;
- (void)setCentisecondHandAngle:(double)angle;
- (void)showCenterIndicator:(BOOL)visible;
- (void)showHourIndicators:(BOOL)visible;
- (void)showSeconds:(BOOL)visible;
- (void)showCentiseconds:(BOOL)visible;

@end
