//
//  TestUIWindow.m
//  MQTouchDemo
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "TestWindow.h"

@implementation TestWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"window send event");
    [super sendEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"window touch began");
    [super touchesBegan:touches withEvent:event];
}

@end
