//
//  Orbit_ClockViewController_iPhone.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "Orbit_ClockViewController_iPhone.h"

@implementation Orbit_ClockViewController_iPhone

@synthesize info_button;
@synthesize prefs;
@synthesize clock_view;

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

- (void)optionsViewControllerDidFinish {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
	
	OptionsViewController *options_view = [[OptionsViewController alloc] initWithNibName:@"OptionsViewController" bundle:nil];
	options_view.delegate = self;
	options_view.center_indicator_visible = [self.prefs boolForKey:@"center_indicator_visible"];
	options_view.hour_indicators_visible = [self.prefs boolForKey:@"hour_indicators_visible"];
	options_view.seconds_visible = [self.prefs boolForKey:@"seconds_visible"];
	options_view.centiseconds_visible = [self.prefs boolForKey:@"centiseconds_visible"];
	options_view.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:options_view animated:YES];
	
	[options_view release];
	
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
	[self.clock_view release];
    [super dealloc];
}


@end
