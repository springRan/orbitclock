//
//  ClockViewController.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "ClockViewController.h"

@implementation ClockViewController

- (void)showIndicators:(BOOL)visible {
	[(ClockView *)self.view showIndicators:visible];
}

- (void)showCentiseconds:(BOOL)visible {
	[(ClockView *)self.view showCentiseconds:visible];
}

- (void)loadView {
	self.view = [[ClockView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[self.view release];
    [super dealloc];
}

@end
