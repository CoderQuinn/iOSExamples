//
//  TestView.m
//  LayerDemo
//
//  Created by MagicianQuentin on 2023/2/28.
//

#import "TestView.h"
#include "TestLayer.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass
{
    return [TestLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

@end
