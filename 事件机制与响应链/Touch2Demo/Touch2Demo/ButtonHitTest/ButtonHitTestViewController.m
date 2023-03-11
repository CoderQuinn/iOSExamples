//
//  ButtonHitTestViewController.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonHitTestViewController.h"
#import "ButtonHitTestView.h"

@interface ButtonHitTestViewController ()

@end

@implementation ButtonHitTestViewController

- (instancetype)init {
    if (self = [super init]) {
        self.navigationItem.title = @"Button HitTest";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    ButtonHitTestView *view = [[ButtonHitTestView alloc] init];
    
    [self.view addSubview:view];
    view.frame = CGRectMake(50, 50, 200, 200);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
