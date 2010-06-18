//
//  Indicators.h
//  OrbitClock
//
//  Created by Aaron Wright on 6/17/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Orbiter.h"

@interface Indicators : UIView {
	
	Orbiter *one;
	Orbiter *two;
	Orbiter *three;
	Orbiter *four;
	Orbiter *five;
	Orbiter *six;
	Orbiter *seven;
	Orbiter *eight;
	Orbiter *nine;
	Orbiter *ten;
	Orbiter *eleven;
	Orbiter *twelve;
	
}

@property (nonatomic, retain) Orbiter *one;
@property (nonatomic, retain) Orbiter *two;
@property (nonatomic, retain) Orbiter *three;
@property (nonatomic, retain) Orbiter *four;
@property (nonatomic, retain) Orbiter *five;
@property (nonatomic, retain) Orbiter *six;
@property (nonatomic, retain) Orbiter *seven;
@property (nonatomic, retain) Orbiter *eight;
@property (nonatomic, retain) Orbiter *nine;
@property (nonatomic, retain) Orbiter *ten;
@property (nonatomic, retain) Orbiter *eleven;
@property (nonatomic, retain) Orbiter *twelve;

@end
