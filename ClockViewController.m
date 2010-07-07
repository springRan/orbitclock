//
//  ClockViewController.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "ClockViewController.h"

@implementation ClockViewController

@synthesize clock_time;
@synthesize timer;
@synthesize centiseconds;

- (void)setTime:(NSDate *)time {
	self.clock_time = time;
}

- (void)drawTime {
	
	self.centiseconds += 0.1;
	
	[(ClockView *)self.view setHourHandAngle:0.1];
	[(ClockView *)self.view setMinuteHandAngle:0.1];
	[(ClockView *)self.view setSecondHandAngle:0.1];
	[(ClockView *)self.view setCentisecondHandAngle:self.centiseconds];
	
	[self.view setNeedsDisplay];
	
}

- (void)showCenterIndicator:(BOOL)visible {
	[(ClockView *)self.view showCenterIndicator:visible];
}

- (void)showHourIndicators:(BOOL)visible {
	[(ClockView *)self.view showHourIndicators:visible];
}

- (void)showSeconds:(BOOL)visible {
	[(ClockView *)self.view showSeconds:visible];
}

- (void)showCentiseconds:(BOOL)visible {
	[(ClockView *)self.view showCentiseconds:visible];
}

- (void)loadView {
	self.view = [[ClockView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (self.clock_time == nil) {
		self.clock_time = [NSDate date];
	}
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(drawTime) userInfo:nil repeats:YES];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[self.timer release];
    [super viewDidUnload];
}

- (void)dealloc {
	[self.timer release];
	[self.clock_time release];
	[self.view release];
    [super dealloc];
}

@end
