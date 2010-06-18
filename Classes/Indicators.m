//
//  Indicators.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/17/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "Indicators.h"

@implementation Indicators

@synthesize one;
@synthesize two;
@synthesize three;
@synthesize four;
@synthesize five;
@synthesize six;
@synthesize seven;
@synthesize eight;
@synthesize nine;
@synthesize ten;
@synthesize eleven;
@synthesize twelve;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		self.backgroundColor = [UIColor clearColor];
		
		self.one = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.two = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.three = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.four = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.five = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.six = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.seven = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.eight = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.nine = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.ten = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.eleven = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.twelve = [[Orbiter alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		
		self.one.fillColor = [UIColor lightGrayColor];
		self.two.fillColor = [UIColor lightGrayColor];
		self.three.fillColor = [UIColor grayColor];
		self.four.fillColor = [UIColor lightGrayColor];
		self.five.fillColor = [UIColor lightGrayColor];
		self.six.fillColor = [UIColor grayColor];
		self.seven.fillColor = [UIColor lightGrayColor];
		self.eight.fillColor = [UIColor lightGrayColor];
		self.nine.fillColor = [UIColor grayColor];
		self.ten.fillColor = [UIColor lightGrayColor];
		self.eleven.fillColor = [UIColor lightGrayColor];
		self.twelve.fillColor = [UIColor grayColor];
		
		self.one.orbitRadius = 360;
		self.two.orbitRadius = 360;
		self.three.orbitRadius = 360;
		self.four.orbitRadius = 360;
		self.five.orbitRadius = 360;
		self.six.orbitRadius = 360;
		self.seven.orbitRadius = 360;
		self.eight.orbitRadius = 360;
		self.nine.orbitRadius = 360;
		self.ten.orbitRadius = 360;
		self.eleven.orbitRadius = 360;
		self.twelve.orbitRadius = 360;
		
		self.one.angle = M_PI / 3;
		self.two.angle = M_PI / 6;
		self.three.angle = 0;
		self.four.angle = (11 * M_PI) / 6;
		self.five.angle = (5 * M_PI) / 3;
		self.six.angle = (3 * M_PI) / 2;
		self.seven.angle = (4 * M_PI) / 3;
		self.eight.angle = (7 * M_PI) / 6;
		self.nine.angle = M_PI;
		self.ten.angle = (5 * M_PI) / 6;
		self.eleven.angle = (2 * M_PI) / 3;
		self.twelve.angle = M_PI / 2;
		
		[self addSubview:self.one];
		[self addSubview:self.two];
		[self addSubview:self.three];
		[self addSubview:self.four];
		[self addSubview:self.five];
		[self addSubview:self.six];
		[self addSubview:self.seven];
		[self addSubview:self.eight];
		[self addSubview:self.nine];
		[self addSubview:self.ten];
		[self addSubview:self.eleven];
		[self addSubview:self.twelve];
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
