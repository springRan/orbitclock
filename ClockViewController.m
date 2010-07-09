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
@synthesize last_second;

- (void)setTime:(NSDate *)time {
	self.clock_time = time;
}

- (void)drawTime {
	
	NSTimeInterval duration = [[NSDate date] timeIntervalSinceDate:self.clock_time];
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self.clock_time];
	[calendar release];
	
	int new_hour = [components hour];
	
	if (new_hour > 12) {
		new_hour = new_hour - 12;
	}
	
	double seconds = [components second] + duration;
	double minutes = [components minute] * 60 + seconds;
	double hours = new_hour * 3600 + minutes;
	
	[(ClockView *)self.view setHourHandAngle:(((2 * M_PI) / 12) * (hours / 3600)) - (M_PI / 2)];
	[(ClockView *)self.view setMinuteHandAngle:(((2 * M_PI) / 60) * (minutes / 60)) - (M_PI / 2)];
	[(ClockView *)self.view setSecondHandAngle:(((2 * M_PI) / 60) * seconds) - (M_PI / 2)];
	[(ClockView *)self.view setCentisecondHandAngle:(((2 * M_PI) / 100) * (duration * 100)) - (M_PI / 2)];
	
	if (self.view.hidden) {
		[self.view setHidden:NO];
	}

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
	[self.view setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (self.clock_time == nil) {
		self.clock_time = [NSDate date];
	}
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(drawTime) userInfo:nil repeats:YES];
	
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
