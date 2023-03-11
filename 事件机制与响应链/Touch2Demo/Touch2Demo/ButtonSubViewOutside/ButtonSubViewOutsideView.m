//
//  ButtonSubViewOutsideView.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonSubViewOutsideView.h"

const static CGFloat buttonExtraPadding = 20;

@interface ButtonSubViewOutsideView ()

@property (nonatomic, strong) UIView *buttonBgView; // 扩展点击响应区域

@property (nonatomic, strong) UIButton *button;

@end

@implementation ButtonSubViewOutsideView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _button = [[UIButton alloc] init];
        [_button setBackgroundColor:[UIColor orangeColor]];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _button.frame = CGRectMake(50, - 1.5 * buttonExtraPadding, 100, 30);
}

- (void)buttonClick:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"button clicked" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if([self.button pointInside:[self convertPoint:point toView:self.button] withEvent:event]) {
        return YES;
    }
    return [super pointInside:point withEvent:event];
}

@end
