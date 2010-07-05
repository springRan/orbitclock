//
//  ClockView.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrbiterView.h"

@interface ClockView : UIView {
	
	NSMutableArray *indicators;
	NSMutableArray *hands;
	
}

@property (nonatomic, retain) NSMutableArray *indicators;
@property (nonatomic, retain) NSMutableArray *hands;

- (void)showCenterIndicator:(BOOL)visible;
- (void)showHourIndicators:(BOOL)visible;
- (void)showSeconds:(BOOL)visible;
- (void)showCentiseconds:(BOOL)visible;

@end
