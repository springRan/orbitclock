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

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(185.0, 185.0);
	self.indicatorSwitch.on = self.indicatorsVisible;
	self.centisecondSwitch.on = self.centisecondsVisible;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.indicatorSwitch release];
	[self.centisecondSwitch release];
	[super dealloc];
}


@end
