//
//  ButtonPointInsideView.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonPointInsideView.h"
#import "MQButton.h"

const static CGFloat buttonExtraPadding = 20;

@interface ButtonPointInsideView ()

@property (nonatomic, strong) UIView *buttonBgView; // 扩展点击响应区域

@property (nonatomic, strong) MQButton *button;

@end

@implementation ButtonPointInsideView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _button = [[MQButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
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

@end
