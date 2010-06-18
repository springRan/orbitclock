//
//  OrbitClockAppDelegate.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/6/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrbitClockViewController;

@interface OrbitClockAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OrbitClockViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet OrbitClockViewController *viewController;

@end