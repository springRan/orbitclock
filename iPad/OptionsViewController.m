//
//  OptionsViewController.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/16/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//SettingsView

#import "OptionsViewController.h"

@implementation OptionsViewController

@synthesize link;
@synthesize indicator_switch;
@synthesize centisecond_switch;
@synthesize indicators_visible;
@synthesize centiseconds_visible;
@synthesize delegate;

- (IBAction)linkToHomePage:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.acwrightdesign.com"]];
}

- (IBAction)toggleIndicators:(id)sender {
	[self.delegate indicatorsChanged:self.indicator_switch.on];
	self.indicators_visible = self.indicator_switch.on;
}

- (IBAction)toggleCentiseconds:(id)sender {
	[self.delegate centisecondsChanged:self.centisecond_switch.on];
	self.centiseconds_visible = self.centisecond_switch.on;
}

- (IBAction)done:(id)sender {
	[self.delegate optionsViewControllerDidFinish];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
	
	self.indicator_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	self.centisecond_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	
	[self.indicator_switch addTarget:self action:@selector(toggleIndicators:) forControlEvents:UIControlEventValueChanged];
	[self.centisecond_switch addTarget:self action:@selector(toggleCentiseconds:) forControlEvents:UIControlEventValueChanged];
	
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

#pragma mark -
#pragma mark === TableView datasource and delegate methods ===
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *label = @"";
	
	switch (section) {
		case 0:
			label = @"Clock Face";
			break;
		case 1:
			label = @"Clock Hands";
			break;
		default:
			break;
	}
	return label;
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *reuseIdentifier = @"PreferencesCellIdentifier";
	
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
	if (indexPath.section == 0) {
		cell.textLabel.text = @"Show Indicators";
		[cell addSubview:self.indicator_switch];
	} else {
		cell.textLabel.text = @"Show Centiseconds";
		[cell addSubview:self.centisecond_switch];
	}
	
    return cell;
}


@end
