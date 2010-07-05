//
//  OrbiterView.m
//  Orbit Clock
//
//  Created by Aaron Wright on 6/27/10.
//  Copyright 2010 A.C. Wright Design. All rights reserved.
//

#import "OrbiterView.h"

@implementation OrbiterView

@synthesize stroke_width;
@synthesize stroke_color;
@synthesize fill_color;

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		
		self.backgroundColor = [UIColor clearColor];
		
		self.stroke_width = DefaultStrokeWidth;
		self.stroke_color = DefaultStrokeColor;
		self.fill_color = DefaultFillColor;
		
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, self.stroke_width);
	CGContextSetStrokeColorWithColor(context, self.stroke_color.CGColor);
	CGContextSetFillColorWithColor(context, self.fill_color.CGColor);
	
	CGContextFillEllipseInRect(context, self.bounds);
	CGContextStrokeEllipseInRect(context, CGRectMake(
		self.bounds.origin.x + (self.stroke_width / 2.0), 
		self.bounds.origin.y + (self.stroke_width / 2.0), 
		self.bounds.size.width - self.stroke_width, 
		self.bounds.size.height - self.stroke_width
	));
	
}

- (void)dealloc {
	[stroke_color release];
	[fill_color release];
	[super dealloc];
}

@end