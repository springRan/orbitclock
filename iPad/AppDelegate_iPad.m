//
//  AppDelegate_iPad.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import "AppDelegate_iPad.h"
#import "Orbit_ClockViewController_iPad.h"

@implementation AppDelegate_iPad

@synthesize window;
@synthesize ipad_view_controller;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	//[window backgroundColor:[UIColor clearColor]];
	[window addSubview:ipad_view_controller.view];
	[window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[ipad_view_controller release];
    [window release];
    [super dealloc];
}


@end
