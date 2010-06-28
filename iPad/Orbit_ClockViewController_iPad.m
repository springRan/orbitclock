    //
//  Orbit_ClockViewController_iPad.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "Orbit_ClockViewController_iPad.h"

@implementation Orbit_ClockViewController_iPad

@synthesize infoView;
@synthesize infoViewPopover;

@synthesize clockView;

@synthesize info_button;

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

- (void)indicatorsChanged:(BOOL)value {
	[self.clockView showIndicators:value];
	[self.prefs setInteger:value forKey:@"indicatorsVisible"];
}

- (void)centisecondsChanged:(BOOL)value {
	[self.clockView showCentiseconds:value];
	[self.prefs setInteger:value forKey:@"centisecondsVisible"];
}

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	self.prefs = [NSUserDefaults standardUserDefaults];
	[self.view bringSubviewToFront:self.info_button];
	
	self.clockView = [ClockViewController alloc];
	self.clockView.view.frame = CGRectMake(0, 0, self.view.frame.size.width - 10.0, self.view.frame.size.width - 10.0);
	self.clockView.view.center = CGPointMake(384.0, 502.0);
	[self.view addSubview:self.clockView.view];
	
	[self indicatorsChanged:[self.prefs integerForKey:@"indicatorsVisible"]];
	[self centisecondsChanged:[self.prefs integerForKey:@"centisecondsVisible"]];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		self.clockView.view.center = CGPointMake(384.0, 502.0);
	}
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.clockView.view.center = CGPointMake(512.0, 374.0);
	}
	
	[self.clockView.view setNeedsDisplay];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[self.infoView release];
	[self.infoViewPopover release];
	[self.clockView release];
    [super dealloc];
}

@end
