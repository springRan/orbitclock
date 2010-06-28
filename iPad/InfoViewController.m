//
//  InfoViewController.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController

@synthesize indicatorSwitch;
@synthesize centisecondSwitch;
@synthesize indicatorsVisible;
@synthesize centisecondsVisible;
@synthesize delegate;

- (IBAction)toggleIndicators:(id)sender {
	[self.delegate indicatorsChanged:self.indicatorSwitch.on];
	self.indicatorsVisible = self.indicatorSwitch.on;
}

- (IBAction)toggleCentiseconds:(id)sender {
	[self.delegate centisecondsChanged:self.centisecondSwitch.on];
	self.centisecondsVisible = self.centisecondSwitch.on;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(185.0, 185.0);
	self.indicatorSwitch.on = self.indicatorsVisible;
	self.centisecondSwitch.on = self.centisecondsVisible;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[self.indicatorSwitch release];
	[self.centisecondSwitch release];
	[super dealloc];
}

@end
