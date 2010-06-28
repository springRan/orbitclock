//
//  ClockView.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

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
		
		self.one = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.two = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.three = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.four = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.five = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.six = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.seven = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.eight = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.nine = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		self.ten = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.eleven = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
		self.twelve = [[OrbiterView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
		
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

- (void)drawRect:(CGRect)rect {
	
	self.one.orbitCenter = self.center;
	self.two.orbitCenter = self.center;
	self.three.orbitCenter = self.center;
	self.four.orbitCenter = self.center;
	self.five.orbitCenter = self.center;
	self.six.orbitCenter = self.center;
	self.seven.orbitCenter = self.center;
	self.eight.orbitCenter = self.center;
	self.nine.orbitCenter = self.center;
	self.ten.orbitCenter = self.center;
	self.eleven.orbitCenter = self.center;
	self.twelve.orbitCenter = self.center;
	
	self.one.orbitRadius = self.frame.size.width / 2;
	self.two.orbitRadius = self.frame.size.width / 2;
	self.three.orbitRadius = self.frame.size.width / 2;
	self.four.orbitRadius = self.frame.size.width / 2;
	self.five.orbitRadius = self.frame.size.width / 2;
	self.six.orbitRadius = self.frame.size.width / 2;
	self.seven.orbitRadius = self.frame.size.width / 2;
	self.eight.orbitRadius = self.frame.size.width / 2;
	self.nine.orbitRadius = self.frame.size.width / 2;
	self.ten.orbitRadius = self.frame.size.width / 2;
	self.eleven.orbitRadius = self.frame.size.width / 2;
	self.twelve.orbitRadius = self.frame.size.width / 2;
	
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
	
}

- (void)dealloc {
	[self.one release];
	[self.two release];
	[self.three release];
	[self.four release];
	[self.five release];
	[self.six release];
	[self.seven release];
	[self.eight release];
	[self.nine release];
	[self.ten release];
	[self.eleven release];
	[self.twelve release];
    [super dealloc];
}


@end
