//
//  OrbiterView.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefaultStrokeWidth		0.0
#define DefaultStrokeColor		[UIColor whiteColor]
#define DefaultFillColor		[UIColor whiteColor]

@interface OrbiterView : UIView {
	double stroke_width;
	UIColor *stroke_color;
	UIColor *fill_color;
}

@property (readwrite, assign) double stroke_width;
@property (nonatomic, retain) UIColor *stroke_color;
@property (nonatomic, retain) UIColor *fill_color;

@end