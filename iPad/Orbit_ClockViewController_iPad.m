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

- (IBAction)showOptions:(id)sender {
	if (self.options_view == nil) {
		self.options_view = [[OptionsViewController alloc] initWithNibName:@"OptionsViewController" bundle:[NSBundle mainBundle]];
		self.options_view.delegate = self;
		self.options_view.indicators_visible = [self.prefs integerForKey:@"indicators_visible"];
		self.options_view.centiseconds_visible = [self.prefs integerForKey:@"centiseconds_visible"];
		self.options_view_popover = [[[UIPopoverController alloc] initWithContentViewController:self.options_view] autorelease];
	}
	[self.options_view_popover presentPopoverFromRect:self.options_button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)indicatorsChanged:(BOOL)value {
	[self.clock_view showIndicators:value];
	[self.prefs setInteger:value forKey:@"indicators_visible"];
}

- (void)centisecondsChanged:(BOOL)value {
	[self.clock_view showCentiseconds:value];
	[self.prefs setInteger:value forKey:@"centiseconds_visible"];
}

- (void)optionsViewControllerDidFinish {
	//Do nothing for iPad!
}

- (void)viewDidLoad {
	
    [super viewDidLoad];

	[self.view bringSubviewToFront:self.options_button];
	
	self.clock_view = [ClockViewController alloc];
	self.clock_view.view.frame = CGRectMake(0, 0, CLOCK_SIZE.width, CLOCK_SIZE.height);
	self.clock_view.view.center = VIEW_CENTER_PORTRAIT;
	[self.view addSubview:self.clock_view.view];
	
	self.prefs = [NSUserDefaults standardUserDefaults];
	[self indicatorsChanged:[self.prefs integerForKey:@"indicators_visible"]];
	[self centisecondsChanged:[self.prefs integerForKey:@"centiseconds_visible"]];
	
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
