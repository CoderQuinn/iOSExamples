//
//  ViewController.m
//  MQTouchDemo
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "ViewController.h"
#import "MQTestView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MQTestView *testView;

@end

@implementation ViewController

// nil -> AppDelegate -> UIApplication -> UIWindowScene -> UIWindow -> UITransitionView -> UIDropShadowView -> ViewController -> UIView -> Subview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testHitTest];
    // 不响应事件
    // 1.
//    self.testView.userInteractionEnabled = NO;
    // 2.
//    self.testView.hidden = YES;
    // 3.
//    self.testView.alpha = 0.01;
}

- (void)testHitTest
{
    MQTestView *viewA = [[MQTestView alloc] init];
    viewA.name = @"viewA";
    viewA.frame = CGRectMake(10, 50, 200, 200);
    viewA.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:viewA];

}

@end
