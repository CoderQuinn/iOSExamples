//
//  MQButton.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "MQButton.h"

const static CGFloat buttonExtraPadding = 20;

@implementation MQButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
//    // 方法 1
//    CGRect targetRect = CGRectInset(self.bounds, -buttonExtraPadding, -buttonExtraPadding);
//    if(CGRectContainsPoint(targetRect, point))
//    {
//        return  YES;
//    }
    
    // 方法 2
    CGPoint convertPoint = [self convertPoint:point toView:self.superview];
    CGRect targetRect = CGRectInset(self.frame, -buttonExtraPadding, -buttonExtraPadding);
    if(CGRectContainsPoint(targetRect, convertPoint))
    {
        return YES;
    }
    
    return [super pointInside:point withEvent:event];
}

@end
