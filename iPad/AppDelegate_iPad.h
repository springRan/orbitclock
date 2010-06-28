//
//  AppDelegate_iPad.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright A.C. Wright Design 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Orbit_ClockViewController_iPad;

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet Orbit_ClockViewController_iPad *ipad_view_controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Orbit_ClockViewController_iPad *ipad_view_controller;

@end

