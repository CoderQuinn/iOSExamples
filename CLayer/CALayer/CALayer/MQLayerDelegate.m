//
//  MQLayerDelegate.m
//  CALayer
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "MQLayerDelegate.h"

@implementation MQLayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillPath(ctx);
}

@end
