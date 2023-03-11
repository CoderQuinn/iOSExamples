//
//  KeyboardView.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "KeyboardView.h"

@interface KeyboardView ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation KeyboardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        _textField = [[UITextField alloc] init];
        [_textField setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_textField];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _textField.frame = CGRectMake(20, 50, 150, 30);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 方法1
//    [self.textField resignFirstResponder];
    
    // 方法2
//    [self endEditing:YES];
    
    // 方法3
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    // 方法4
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
