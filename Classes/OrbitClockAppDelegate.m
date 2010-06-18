//
//  OrbitClockAppDelegate.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/6/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import "OrbitClockAppDelegate.h"
#import "OrbitClockViewController.h"

@implementation OrbitClockAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	// Override point for customization after app launch  
	window.backgroundColor = [UIColor clearColor];
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];

	return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end