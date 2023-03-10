//
//  ViewController.m
//  LayerDemo
//
//  Created by MagicianQuentin on 2023/2/28.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property(nonatomic,retain)NSString * sname;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // demo1.1 view.backgroundColor vs layer.backgroundColor
//    UIView *view1 = [[UIView alloc] init];
//    view1.frame = CGRectMake(50, 100, 100, 100);
//    view1.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view1];
//
//    UIView *view2 = [[UIView alloc] init];
//    view2.layer.frame = CGRectMake(200, 100, 100, 100);
//    view2.layer.backgroundColor = [UIColor orangeColor].CGColor;
//    [self.view addSubview:view2];
//
//    UIView *view3 = [[UIView alloc] init];
//    view3.frame = CGRectMake(200, 250, 100, 100);
//    view3.backgroundColor = view2.backgroundColor;
//    [self.view addSubview:view3];
    
    // demo2.1
//    TestView *view = [[TestView alloc] init];
//    self.view = view;
    
    // demo3.1
//    CALayer *layer1 = [[CALayer alloc] init];
//    layer1.backgroundColor = [UIColor orangeColor].CGColor;
//    layer1.frame = CGRectMake(100, 100, 150, 150);
//
//    layer1.borderColor = [UIColor redColor].CGColor;
//    layer1.borderWidth = 2;
//
//    layer1.cornerRadius = 10;
//    layer1.masksToBounds = YES; // 圆角
//
//    NSLog(@"%@", NSStringFromCGPoint(layer1.position));
//    NSLog(@"%@", NSStringFromCGPoint(layer1.anchorPoint));
//
//    layer1.anchorPoint = CGPointMake(0.5, 0.5);
//    NSLog(@"%@", NSStringFromCGPoint(layer1.position));
//    NSLog(@"%@", NSStringFromCGRect(layer1.frame));
//
////    layer1.position = CGPointMake(100, 100);
//    layer1.frame = CGRectMake(100, 100, 150, 150);
//
//    layer1.contents = (id)[UIImage imageNamed:@"iPhone.jpg"].CGImage;
//    layer1.transform = CATransform3DMakeRotation(M_PI / 3, 1, 0, 0);
//
//    [self.view.layer addSublayer:layer1];
    
    // 4.1
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(50, 100, 100, 100);
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    NSLog(@"view1.layer: %@", view1.layer);

    UIView *view2 = [[UIView alloc] init];
    view2.layer.frame = CGRectMake(200, 100, 100, 100);
    view2.layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:view2];
    NSLog(@"view2.layer: %@", view2.layer);
    
    CALayer *layer3 = [[CALayer alloc] init];
    layer3.frame = CGRectMake(50, 250, 100, 100);
    layer3.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:layer3];
    NSLog(@"layer3: %@", layer3);
    
    for (CALayer *layer in self.view.layer.sublayers) {
        NSLog(@"%@", layer);
    }
    
}


@end
