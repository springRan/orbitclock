//
//  Orbiter.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefaultStrokeColor		[UIColor whiteColor]
#define DefaultFillColor		[UIColor whiteColor]
#define DefaultCenter			CGPointMake(384,502)
#define DefaultOrbitCenter		CGPointMake(384,502)
#define DefaultOrbitRadius		0.0
#define DefaultAngle				M_PI

@interface Orbiter : UIView {
	UIColor *strokeColor;
	UIColor *fillColor;
	CGPoint orbitCenter;
	double orbitRadius;
	double angle;
}

@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, retain) UIColor *fillColor;
@property (readwrite, assign) CGPoint orbitCenter;
@property (readwrite, assign) double orbitRadius;
@property (readwrite, assign) double angle;

- (CGPoint)calculateCenter;

@end