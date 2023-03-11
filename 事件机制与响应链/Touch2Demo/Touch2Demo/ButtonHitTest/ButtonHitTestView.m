//
//  ButtonHitTestView.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonHitTestView.h"

const static CGFloat buttonExtraPadding = 20;

@interface ButtonHitTestView ()

@property (nonatomic, strong) UIView *buttonBgView; // 扩展点击响应区域

@property (nonatomic, strong) UIButton *button;

@end

@implementation ButtonHitTestView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
        [_button setBackgroundColor:[UIColor orangeColor]];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _buttonBgView = [[UIView alloc] init];
        _buttonBgView.layer.borderColor = [UIColor redColor].CGColor;
        _buttonBgView.layer.borderWidth = 1;
        _buttonBgView.frame = CGRectMake(_button.frame.origin.x - buttonExtraPadding, _button.frame.origin.y - buttonExtraPadding, _button.frame.size.width + buttonExtraPadding*2, _button.frame.size.height + buttonExtraPadding*2);
        
        [self addSubview:_buttonBgView];
        [self addSubview:_button];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)buttonClick:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"button clicked" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
//  方法1
    // CGRect targetRect = CGRectMake(_button.frame.origin.x - buttonExtraPadding, _button.frame.origin.y - buttonExtraPadding, _button.frame.size.width + buttonExtraPadding*2, _button.frame.size.height + buttonExtraPadding*2);
//  方法2
    CGRect targetRect = CGRectInset(self.button.frame, -buttonExtraPadding, -buttonExtraPadding);
    if (CGRectContainsPoint(targetRect, point)) {
        return  self.button;
    }
    return [super hitTest:point withEvent:event];
}

@end
