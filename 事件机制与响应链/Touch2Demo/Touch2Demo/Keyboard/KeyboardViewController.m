//
//  KeyboardViewController.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "KeyboardViewController.h"
#import "KeyboardView.h"

@interface KeyboardViewController ()

@end

@implementation KeyboardViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"Keyboard";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    KeyboardView *view = [[KeyboardView alloc] init];
    [self.view addSubview:view];
    view.frame = CGRectMake(50, 50, 200, 200);

}

@end
