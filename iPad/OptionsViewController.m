//
//  OptionsViewController.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//SettingsView

#import "OptionsViewController.h"

@implementation OptionsViewController

@synthesize indicator_switch;
@synthesize centisecond_switch;
@synthesize indicators_visible;
@synthesize centiseconds_visible;
@synthesize delegate;

- (IBAction)toggleIndicators:(id)sender {
	[self.delegate indicatorsChanged:self.indicator_switch.on];
	self.indicators_visible = self.indicator_switch.on;
}

- (IBAction)toggleCentiseconds:(id)sender {
	[self.delegate centisecondsChanged:self.centisecond_switch.on];
	self.centiseconds_visible = self.centisecond_switch.on;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
	self.indicator_switch.on = self.indicators_visible;
	self.centisecond_switch.on = self.centiseconds_visible;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[self.indicator_switch release];
	[self.centisecond_switch release];
	[super dealloc];
}

@end
