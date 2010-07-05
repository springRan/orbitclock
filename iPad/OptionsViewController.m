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
@synthesize center_indicator_switch;
@synthesize hour_indicators_switch;
@synthesize seconds_switch;
@synthesize centiseconds_switch;
@synthesize center_indicator_visible;
@synthesize hour_indicators_visible;
@synthesize seconds_visible;
@synthesize centiseconds_visible;
@synthesize delegate;

- (IBAction)linkToHomePage:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.acwrightdesign.com"]];
}

- (IBAction)showCenterIndicator:(id)sender {
	[self.delegate showCenterIndicator:(BOOL)self.center_indicator_switch.on];
	self.center_indicator_visible = (BOOL)self.center_indicator_switch.on;
}

- (IBAction)showHourIndicators:(id)sender {
	[self.delegate showHourIndicators:(BOOL)self.hour_indicators_switch.on];
	self.hour_indicators_visible = (BOOL)self.hour_indicators_switch.on;
}

- (IBAction)showSeconds:(id)sender {
	[self.delegate showSeconds:(BOOL)self.seconds_switch.on];
	self.seconds_visible = (BOOL)self.seconds_switch.on;
}

- (IBAction)showCentiseconds:(id)sender {
	[self.delegate showCentiseconds:(BOOL)self.centiseconds_switch.on];
	self.centiseconds_visible = (BOOL)self.centiseconds_switch.on;
}

- (IBAction)done:(id)sender {
	[self.delegate optionsViewControllerDidFinish];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
	
	self.center_indicator_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	self.hour_indicators_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	self.seconds_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	self.centiseconds_switch = [[UISwitch alloc] initWithFrame:CGRectMake(207.0, 10.0, 180.0, 56.0)];
	
	[self.center_indicator_switch addTarget:self action:@selector(showCenterIndicator:) forControlEvents:UIControlEventValueChanged];
	[self.hour_indicators_switch addTarget:self action:@selector(showHourIndicators:) forControlEvents:UIControlEventValueChanged];
	[self.seconds_switch addTarget:self action:@selector(showSeconds:) forControlEvents:UIControlEventValueChanged];
	[self.centiseconds_switch addTarget:self action:@selector(showCentiseconds:) forControlEvents:UIControlEventValueChanged];
	
	self.center_indicator_switch.on = (int)self.center_indicator_visible;
	self.hour_indicators_switch.on = (int)self.hour_indicators_visible;
	self.seconds_switch.on = self.seconds_visible;
	self.centiseconds_switch.on = self.centiseconds_visible;
	
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
	[self.center_indicator_switch release];
	[self.hour_indicators_switch release];
	[self.seconds_switch release];
	[self.centiseconds_switch release];
	[super dealloc];
}

#pragma mark -
#pragma mark === TableView datasource and delegate methods ===
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *label = @"";
	
	switch (section) {
		case 0:
			label = @"Indicators";
			break;
		case 1:
			label = @"Hands";
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
    
	switch (indexPath.section) {
		case 0:
			switch (indexPath.row) {
				case 0:
					cell.textLabel.text = @"Hours";
					[cell addSubview:self.hour_indicators_switch];
					break;
				case 1:
					cell.textLabel.text = @"Center";
					[cell addSubview:self.center_indicator_switch];
					break;
				default:
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
					cell.textLabel.text = @"Seconds";
					[cell addSubview:self.seconds_switch];
					break;
				case 1:
					cell.textLabel.text = @"Centiseconds";
					[cell addSubview:self.centiseconds_switch];
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}
	
    return cell;
}


@end
