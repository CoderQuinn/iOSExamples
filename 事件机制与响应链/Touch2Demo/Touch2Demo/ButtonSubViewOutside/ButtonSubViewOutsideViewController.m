//
//  ButtonSubViewOutsideViewController.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "ButtonSubViewOutsideViewController.h"
#import "ButtonSubViewOutsideView.h"

@interface ButtonSubViewOutsideViewController ()

@end

@implementation ButtonSubViewOutsideViewController

- (instancetype)init {
    if (self = [super init]) {
        self.navigationItem.title = @"Subview OutSide";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    ButtonSubViewOutsideView *view = [[ButtonSubViewOutsideView alloc] init];
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
