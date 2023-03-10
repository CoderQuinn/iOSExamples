//
//  TestLayer.m
//  CALayer
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "MQTestLayer.h"

@implementation MQTestLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextFillPath(ctx);
}

@end
