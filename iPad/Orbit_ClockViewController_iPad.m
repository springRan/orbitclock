//
//  Orbit_ClockViewController_iPad.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "Orbit_ClockViewController_iPad.h"

@implementation Orbit_ClockViewController_iPad

@synthesize prefs;
@synthesize options_view;
@synthesize clock_view;
@synthesize options_view_popover;
@synthesize options_button;

- (void)showCenterIndicator:(BOOL)visible {
	[self.clock_view showCenterIndicator:visible];
	[self.prefs setBool:visible forKey:@"center_indicator_visible"];
}

- (void)showHourIndicators:(BOOL)visible {
	[self.clock_view showHourIndicators:visible];
	[self.prefs setBool:visible forKey:@"hour_indicators_visible"];
}

- (void)showSeconds:(BOOL)visible {
	[self.clock_view showSeconds:visible];
	[self.prefs setBool:visible forKey:@"seconds_visible"];
}

- (void)showCentiseconds:(BOOL)visible {
	[self.clock_view showCentiseconds:visible];
	[self.prefs setBool:visible forKey:@"centiseconds_visible"];
}

- (IBAction)showOptions:(id)sender {
	if (self.options_view == nil) {
		self.options_view = [[OptionsViewController alloc] initWithNibName:@"OptionsViewController" bundle:[NSBundle mainBundle]];
		self.options_view.delegate = self;
		self.options_view.center_indicator_visible = [self.prefs boolForKey:@"center_indicator_visible"];
		self.options_view.hour_indicators_visible = [self.prefs boolForKey:@"hour_indicators_visible"];
		self.options_view.seconds_visible = [self.prefs boolForKey:@"seconds_visible"];
		self.options_view.centiseconds_visible = [self.prefs boolForKey:@"centiseconds_visible"];
		self.options_view_popover = [[[UIPopoverController alloc] initWithContentViewController:self.options_view] autorelease];
	}
	[self.options_view_popover presentPopoverFromRect:self.options_button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)optionsViewControllerDidFinish {
	[self.options_view_popover dismissPopoverAnimated:YES];
}

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	self.clock_view = [ClockViewController alloc];
	[self.clock_view setTime:[NSDate date]];
	self.clock_view.view.frame = CGRectMake(0, 0, CLOCK_SIZE.width, CLOCK_SIZE.height);
	self.clock_view.view.center = VIEW_CENTER_PORTRAIT;
	[self.view addSubview:self.clock_view.view];
	
	self.prefs = [NSUserDefaults standardUserDefaults];
	
	NSDictionary *app_prefs = [NSDictionary dictionaryWithObjectsAndKeys:
							   [NSNumber numberWithBool:TRUE], @"center_indicator_visible",
							   [NSNumber numberWithBool:TRUE], @"hour_indicators_visible",
							   [NSNumber numberWithBool:TRUE], @"seconds_visible",
							   [NSNumber numberWithBool:TRUE], @"centiseconds_visible",
							   nil];
	
	[self.prefs registerDefaults:app_prefs];
	[self.prefs synchronize];
	
	[self showCenterIndicator:[self.prefs boolForKey:@"center_indicator_visible"]];
	[self showHourIndicators:[self.prefs boolForKey:@"hour_indicators_visible"]];
	[self showSeconds:[self.prefs boolForKey:@"seconds_visible"]];
	[self showCentiseconds:[self.prefs boolForKey:@"centiseconds_visible"]];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		self.clock_view.view.center = VIEW_CENTER_PORTRAIT;
	}
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.clock_view.view.center = VIEW_CENTER_LANDSCAPE;
	}
	
	[self.clock_view.view setNeedsDisplay];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[self.options_view release];
	[self.options_view_popover release];
	[self.clock_view release];
    [super dealloc];
}

@end
