//
//  TestApplication.m
//  MQTouchDemo
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "TestApplication.h"

@implementation TestApplication

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"application send event");
    [super sendEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"application touch began");
    [super touchesBegan:touches withEvent:event];
}

@end
