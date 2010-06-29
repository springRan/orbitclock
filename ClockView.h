//
//  ClockView.h
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrbiterView.h"

@interface ClockView : UIView {
	
	OrbiterView *one;
	OrbiterView *two;
	OrbiterView *three;
	OrbiterView *four;
	OrbiterView *five;
	OrbiterView *six;
	OrbiterView *seven;
	OrbiterView *eight;
	OrbiterView *nine;
	OrbiterView *ten;
	OrbiterView *eleven;
	OrbiterView *twelve;
	
}

@property (nonatomic, retain) OrbiterView *one;
@property (nonatomic, retain) OrbiterView *two;
@property (nonatomic, retain) OrbiterView *three;
@property (nonatomic, retain) OrbiterView *four;
@property (nonatomic, retain) OrbiterView *five;
@property (nonatomic, retain) OrbiterView *six;
@property (nonatomic, retain) OrbiterView *seven;
@property (nonatomic, retain) OrbiterView *eight;
@property (nonatomic, retain) OrbiterView *nine;
@property (nonatomic, retain) OrbiterView *ten;
@property (nonatomic, retain) OrbiterView *eleven;
@property (nonatomic, retain) OrbiterView *twelve;

- (void)showIndicators:(BOOL)visible;
- (void)showCentiseconds:(BOOL)visible;

@end
