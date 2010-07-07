//
//  ClockView.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

@synthesize hour_hand_angle;
@synthesize minute_hand_angle;
@synthesize second_hand_angle;
@synthesize centisecond_hand_angle;
@synthesize indicators;
@synthesize hands;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		self.backgroundColor = [UIColor clearColor];
		
		self.indicators = [[NSMutableArray alloc] init];
		self.hands = [[NSMutableArray alloc] init];
		
		self.hour_hand_angle = DEFAULT_HOUR_HAND_ANGLE;
		self.minute_hand_angle = DEFAULT_MINUTE_HAND_ANGLE;
		self.second_hand_angle = DEFAULT_SECOND_HAND_ANGLE;
		self.centisecond_hand_angle = DEFAULT_CENTISECOND_HAND_ANGLE;
		
		for (int i = 0; i < 13; i++) {
			
			OrbiterView *indicator = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
			indicator.stroke_color = [UIColor lightGrayColor];
			indicator.fill_color = [UIColor darkGrayColor];
			[self.indicators addObject:indicator];
			[self addSubview:indicator];
			[indicator release];
			
		}
		
		for (int i = 0; i < 4; i++) {
			
			OrbiterView *hand = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
			hand.stroke_color = [UIColor whiteColor];
			hand.fill_color = [UIColor whiteColor];
			[self.hands addObject:hand];
			[self addSubview:hand];
			[hand release];
			
		}
		
    }
    return self;
}
 
- (void)drawRect:(CGRect)rect {
	
	/* Calculate center points and sizes for indicators */
	for (int i = 0; i < 13; i++) {
		
		OrbiterView *view =  (OrbiterView *)[self.indicators objectAtIndex:i];
		
		if (i % 3 == 0) {
			view.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.05), floor((self.frame.size.width / 2) * 0.05));
		} else {
			view.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.025), floor((self.frame.size.width / 2) * 0.025));
		}
		
		if (i != 0) {
			double angle = (M_PI / 3.0) - ((M_PI / 6.0) * (double)(i - 1));
			view.center = CGPointMake(
				(self.bounds.size.width / 2) + (((self.frame.size.width * 0.95) / 2) * cos(angle)), 
				(self.bounds.size.width / 2) + (((self.frame.size.width * 0.95) / 2) * sin(angle))
			);
		} else {
			view.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
		}
		
	}
	
	/* Calculate center points and sizes for hands */
	OrbiterView *centisecond_hand =  (OrbiterView *)[self.hands objectAtIndex:0];
	OrbiterView *second_hand = (OrbiterView *)[self.hands objectAtIndex:1];
	OrbiterView *minute_hand =  (OrbiterView *)[self.hands objectAtIndex:2];
	OrbiterView *hour_hand =  (OrbiterView *)[self.hands objectAtIndex:3];
	
	centisecond_hand.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.02), floor((self.frame.size.width / 2) * 0.02));
	second_hand.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.08), floor((self.frame.size.width / 2) * 0.08));
	minute_hand.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.15), floor((self.frame.size.width / 2) * 0.15));
	hour_hand.frame = CGRectMake(0.0, 0.0, floor((self.frame.size.width / 2) * 0.35), floor((self.frame.size.width / 2) * 0.35));
	
	second_hand.center = CGPointMake(
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.8) / 2) * cos(second_hand_angle)), 
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.8) / 2) * sin(second_hand_angle))
	);
	centisecond_hand.center = CGPointMake(
		second_hand.center.x + (((self.frame.size.width * 0.065) / 2) * cos(centisecond_hand_angle)), 
		second_hand.center.y + (((self.frame.size.width * 0.065) / 2) * sin(centisecond_hand_angle))
	);
	minute_hand.center = CGPointMake(
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.615) / 2) * cos(minute_hand_angle)), 
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.615) / 2) * sin(minute_hand_angle))
	);
	hour_hand.center = CGPointMake(
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.275) / 2) * cos(hour_hand_angle)), 
		(self.bounds.size.width / 2) + (((self.frame.size.width * 0.275) / 2) * sin(hour_hand_angle))
	);
	
}

- (void)setHourHandAngle:(double)angle {
	self.hour_hand_angle = angle;
}

- (void)setMinuteHandAngle:(double)angle {
	self.minute_hand_angle = angle;
}

- (void)setSecondHandAngle:(double)angle {
	self.second_hand_angle = angle;
}

- (void)setCentisecondHandAngle:(double)angle {
	self.centisecond_hand_angle = angle;
}

- (void)showCenterIndicator:(BOOL)visible {
	OrbiterView *view =  (OrbiterView *)[self.indicators objectAtIndex:0];
	view.hidden = !visible;
}

- (void)showHourIndicators:(BOOL)visible {
	for (int i = 0; i < 13; i++) {
		if (i != 0) {
			OrbiterView *view =  (OrbiterView *)[self.indicators objectAtIndex:i];
			view.hidden = !visible;
		}
	}
}

- (void)showSeconds:(BOOL)visible {
	OrbiterView *view =  (OrbiterView *)[self.hands objectAtIndex:1];
	view.hidden = !visible;
}

- (void)showCentiseconds:(BOOL)visible {
	OrbiterView *view =  (OrbiterView *)[self.hands objectAtIndex:0];
	view.hidden = !visible;
}

- (void)dealloc {
	[indicators release];
	[hands release];
    [super dealloc];
}

@end
