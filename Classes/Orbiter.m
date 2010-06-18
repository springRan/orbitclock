//
//  Orbiter.m
//  OrbitClock
//
//  Created by Aaron Wright on 6/6/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "Orbiter.h"

@implementation Orbiter

@synthesize strokeColor;
@synthesize fillColor;
@synthesize orbitCenter;
@synthesize orbitRadius;
@synthesize angle;

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor clearColor];
		self.strokeColor = DefaultStrokeColor;
		self.fillColor = DefaultFillColor;
		self.orbitCenter = DefaultOrbitCenter;
		self.orbitRadius = DefaultOrbitRadius;
		self.angle = DefaultAngle;
		self.center = DefaultCenter;
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	
	// Set the dot color
	CGContextSetStrokeColorWithColor(contextRef, self.strokeColor.CGColor);
	CGContextSetFillColorWithColor(contextRef, self.fillColor.CGColor);

	CGContextFillEllipseInRect(contextRef, self.bounds);

	self.center = self.calculateCenter;
	
}

- (CGPoint)calculateCenter {

	return CGPointMake(self.orbitCenter.x + (self.orbitRadius * cos(self.angle)), self.orbitCenter.y + (self.orbitRadius * sin(self.angle)));
	
}

- (void)dealloc {
	[strokeColor release];
	[fillColor release];
	[super dealloc];
}

@end