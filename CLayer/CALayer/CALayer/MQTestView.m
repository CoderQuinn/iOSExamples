//
//  TestView.m
//  CALayer
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "MQTestView.h"
#import "MQTestLayer.h"

@implementation MQTestView

+ (Class)layerClass {
    return [MQTestLayer class];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
//    CGContextFillPath(ctx);
//}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
//    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
//    CGContextFillPath(ctx);
//}

@end
