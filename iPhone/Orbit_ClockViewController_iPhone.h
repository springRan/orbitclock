//
//  Orbit_ClockViewController_iPhone.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockViewController.h"

@interface Orbit_ClockViewController_iPhone : UIViewController {
	
	NSUserDefaults *prefs;
	IBOutlet UIButton *info_button;
	ClockViewController *clockView;
	
}

@property (nonatomic, assign) NSUserDefaults *prefs;
@property (nonatomic, retain) IBOutlet UIButton *info_button;
@property (nonatomic, retain) ClockViewController *clockView;

@end
