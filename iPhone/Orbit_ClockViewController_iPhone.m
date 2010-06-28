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

@synthesize clockView;

- (void)viewDidLoad {
    
	[super viewDidLoad];
 
	self.clockView = [ClockViewController alloc];
	self.clockView.view.frame = CGRectMake(0, 0, self.view.frame.size.width - 10.0, self.view.frame.size.width - 10.0);
	self.clockView.view.center = CGPointMake(160.0, 230.0);
	[self.view addSubview:self.clockView.view];
 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		self.clockView.view.center = CGPointMake(160.0, 230.0);
	}
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.clockView.view.center = CGPointMake(240.0, 150.0);
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
	[self.clockView release];
    [super dealloc];
}


@end
