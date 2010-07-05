//
//  ClockView.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

@synthesize indicators;
@synthesize hands;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		self.backgroundColor = [UIColor clearColor];
		
		self.indicators = [[NSMutableArray alloc] init];
		
		/*self.one = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.two = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.three = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16.0, 16.0)];
		self.four = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.five = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.six = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16.0, 16.0)];
		self.seven = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.eight = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.nine = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16.0, 16.0)];
		self.ten = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.eleven = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
		self.twelve = [[OrbiterView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16.0, 16.0)];
		
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
		[self addSubview:self.twelve];*/
		
		OrbiterView *view1 = [[OrbiterView alloc] initWithFrame:CGRectMake(100.0, 100.0, 42.0, 42.0)];
		view1.stroke_width = 1.0;
		view1.stroke_color = [UIColor lightGrayColor];
		view1.fill_color = [UIColor darkGrayColor];
		[self.indicators addObject:view1];
		
		[self addSubview:view1];
		[view1 release];
		
    }
    return self;
}
 
- (void)drawRect:(CGRect)rect {
	
	/*
	NSMutableArray *viewArray;
	 
	viewArray = [[NSMutableArray aolloc] init];
	UIView *aView = //create a view here
	[viewArray addObject: aView]
	 
	//change to a particular view*/
	//OrbiterView *view1 =  (OrbiterView *)[self.indicators objectAtIndex:0];
	//view1.frame = CGRectMake(200.0, 200.0, 8.0, 8.0);
	
	/*self.one.fillColor = [UIColor lightGrayColor];
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
	
	//NSLog(@"Center: %@", NSStringFromCGPoint(self.center));
	//NSLog(@"Size: %@", NSStringFromCGSize(self.frame.size));
	
	self.one.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.two.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.three.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.four.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.five.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.six.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.seven.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.eight.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.nine.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.ten.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.eleven.orbitRadius = (self.frame.size.width - 32.0) / 2;
	self.twelve.orbitRadius = (self.frame.size.width - 32.0) / 2;
	
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
	
	self.one.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.two.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.three.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.four.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.five.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.six.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.seven.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.eight.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.nine.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.ten.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.eleven.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
	self.twelve.orbitCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);*/
	
}

- (void)showCenterIndicator:(BOOL)visible {
	NSLog(@"%i", (int)visible);
}

- (void)showHourIndicators:(BOOL)visible {
	NSLog(@"%i", (int)visible);
}

- (void)showSeconds:(BOOL)visible {
	NSLog(@"%i", (int)visible);
}

- (void)showCentiseconds:(BOOL)visible {
	NSLog(@"%i", (int)visible);
}

/*
 - (CGPoint)calculateCenter {
 
 return CGPointMake(self.orbitCenter.x + (self.orbitRadius * cos(self.angle)), self.orbitCenter.y + (self.orbitRadius * sin(self.angle)));
 
 }
 */

- (void)dealloc {
	/*[self.one release];
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
	[self.twelve release];*/
    [super dealloc];
}


@end
