//
//  OrbitClockViewController.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/6/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import "OrbitClockViewController.h"

@implementation OrbitClockViewController

@synthesize infoView;
@synthesize infoViewPopover;

@synthesize info_button;
@synthesize center_hand;
@synthesize hour_hand;
@synthesize minute_hand;
@synthesize second_hand;
@synthesize centisecond_hand;
@synthesize indicators;
@synthesize timer;
@synthesize hour;
@synthesize minute;
@synthesize second;
@synthesize centisecond;

@synthesize prefs;

- (IBAction)showInfo:(id)sender {
	if (self.infoView == nil) {
		self.infoView = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:[NSBundle mainBundle]];
		self.infoView.delegate = self;
		self.infoView.indicatorsVisible = [self.prefs integerForKey:@"indicatorsVisible"];
		self.infoView.centisecondsVisible = [self.prefs integerForKey:@"centisecondsVisible"];
		self.infoViewPopover = [[[UIPopoverController alloc] initWithContentViewController:self.infoView] autorelease];
	}
	[self.infoViewPopover presentPopoverFromRect:self.info_button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.prefs = [NSUserDefaults standardUserDefaults];
	
	self.indicators = [[Indicators alloc] initWithFrame:self.view.bounds];
	
	self.center_hand = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
	self.hour_hand = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 116, 116)];
	self.minute_hand = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
	self.second_hand = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
	self.centisecond_hand = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
	
	self.center_hand.fillColor = [UIColor grayColor];
	
	self.hour_hand.orbitRadius = 115;
	self.minute_hand.orbitRadius = 220;
	self.second_hand.orbitRadius = 305;
	self.centisecond_hand.orbitRadius = 32;

	self.centisecond_hand.orbitCenter = self.second_hand.calculateCenter;
	
	[self.view addSubview:self.indicators];
	
	[self.view addSubview:self.center_hand];
	[self.view addSubview:self.hour_hand];
	[self.view addSubview:self.minute_hand];
	[self.view addSubview:self.second_hand];
	[self.view addSubview:self.centisecond_hand];
	
	[self.view bringSubviewToFront:self.info_button];
	
	[self indicatorsChanged:[self.prefs integerForKey:@"indicatorsVisible"]];
	[self centisecondsChanged:[self.prefs integerForKey:@"centisecondsVisible"]];
	
	[self startTimer];
	
}

- (void)startTimer {
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDate *now = [NSDate date];
	NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:now];
	
	int new_hour = [components hour];
	
	if (new_hour > 12) {
		new_hour = new_hour - 12;
	}
	
	self.centisecond = 0;
	self.second = [components second];
	self.minute = [components minute] * 60 + self.second;
	self.hour = new_hour * 3600 + self.minute;
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(setTime) userInfo:nil repeats:YES];
	
}

- (void)setTime {
	
	if (self.hour >= 43200) {
		self.hour = 0;
	}
	if (self.minute >= 3600) {
		self.minute = 0;
	}
	if (self.second >= 60) {
		self.second = 0;
	}
	if (self.centisecond >= 1) {
		self.centisecond = 0;
	}
	
	self.hour_hand.angle = (((2 * M_PI) / 12) * (self.hour / 3600)) - (M_PI / 2);
	self.minute_hand.angle = (((2 * M_PI) / 60) * (self.minute / 60)) - (M_PI / 2);
	self.second_hand.angle = (((2 * M_PI) / 60) * self.second) - (M_PI / 2);
	self.centisecond_hand.angle = ((self.centisecond * 360) * (M_PI / 180)) - (M_PI / 2);
	
	self.centisecond_hand.orbitCenter = self.second_hand.calculateCenter;
	
	[self.hour_hand setNeedsDisplay];
	[self.minute_hand setNeedsDisplay];
	[self.second_hand setNeedsDisplay];
	[self.centisecond_hand setNeedsDisplay];
	
	self.hour += 0.01;
	self.minute += 0.01;
	self.second += 0.01;
	self.centisecond += 0.01;
	
}

- (void)indicatorsChanged:(BOOL)value {
	if (value) {
		self.indicators.hidden = NO;
	} else {
		self.indicators.hidden = YES;
	}
	[self.prefs setInteger:value forKey:@"indicatorsVisible"];
}

- (void)centisecondsChanged:(BOOL)value {
	if (value) {
		self.centisecond_hand.hidden = NO;
	} else {
		self.centisecond_hand.hidden = YES;
	}
	[self.prefs setInteger:value forKey:@"centisecondsVisible"];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	CGPoint new_center = CGPointMake(0, 0);
	
	if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		new_center.x = 384.0;
		new_center.y = 502.0;
	}
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		new_center.x = 512.0;
		new_center.y = 374.0;
	}
	
	self.indicators.center = new_center;
	self.center_hand.orbitCenter = new_center;
	self.hour_hand.orbitCenter = new_center;
	self.minute_hand.orbitCenter = new_center;
	self.second_hand.orbitCenter = new_center;
	self.centisecond_hand.orbitCenter = self.second_hand.calculateCenter;
	
	[self.indicators setNeedsDisplay];
	[self.center_hand setNeedsDisplay];
	[self.hour_hand setNeedsDisplay];
	[self.minute_hand setNeedsDisplay];
	[self.second_hand setNeedsDisplay];
	[self.centisecond_hand setNeedsDisplay];
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[self.infoView release];
	[self.infoViewPopover release];
	[self.center_hand release];
	[self.hour_hand release];
	[self.minute_hand release];
	[self.second_hand release];
	[self.centisecond_hand release];
	[self.indicators release];
	[self.timer release];
	[super dealloc];
}

@end