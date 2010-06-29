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

- (void)indicatorsChanged:(BOOL)value {
	[self.clock_view showIndicators:value];
	[self.prefs setInteger:value forKey:@"indicators_visible"];
}

- (void)centisecondsChanged:(BOOL)value {
	[self.clock_view showCentiseconds:value];
	[self.prefs setInteger:value forKey:@"centiseconds_visible"];
}

- (void)optionsViewControllerDidFinish {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
	
	OptionsViewController *options_view = [[OptionsViewController alloc] initWithNibName:@"OptionsViewController" bundle:nil];
	options_view.delegate = self;
	options_view.indicators_visible = [self.prefs integerForKey:@"indicators_visible"];
	options_view.centiseconds_visible = [self.prefs integerForKey:@"centiseconds_visible"];
	options_view.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:options_view animated:YES];
	
	[options_view release];
	
}

- (void)viewDidLoad {
    
	[super viewDidLoad];
 
	self.clock_view = [ClockViewController alloc];
	self.clock_view.view.frame = CGRectMake(0, 0, CLOCK_SIZE.width, CLOCK_SIZE.height);
	self.clock_view.view.center = VIEW_CENTER_PORTRAIT;
	[self.view addSubview:self.clock_view.view];
	
	self.prefs = [NSUserDefaults standardUserDefaults];
	[self indicatorsChanged:[self.prefs integerForKey:@"indicators_visible"]];
	[self centisecondsChanged:[self.prefs integerForKey:@"centiseconds_visible"]];
 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
