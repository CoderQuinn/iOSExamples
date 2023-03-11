//
//  ButtonPointInsideViewController.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonPointInsideViewController.h"
#import "ButtonPointInsideView.h"

@implementation ButtonPointInsideViewController

- (instancetype)init {
    if (self = [super init]) {
        self.navigationItem.title = @"Button PointInside";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    ButtonPointInsideView *view = [[ButtonPointInsideView alloc] init];
    
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
