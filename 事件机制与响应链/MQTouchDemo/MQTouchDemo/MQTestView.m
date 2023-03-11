//
//  MQTestView.m
//  MQTouchDemo
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "MQTestView.h"

@implementation MQTestView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touch begin%@", self);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch moved%@", self);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch end%@", self);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
//    NSLog(@"hit test from %@", self.name);
    UIView *hitView = [super hitTest:point withEvent:event];
//    NSLog(@"return hit view %@, self %@", hitView, self);
    return hitView;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[TestView %@]", self.name];
}

@end
