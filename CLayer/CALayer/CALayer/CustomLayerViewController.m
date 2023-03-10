//
//  CustomLayerViewController.m
//  CALayer
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "CustomLayerViewController.h"
#import "MQTestLayer.h"
#import "MQTestView.h"
#import "MQLayerDelegate.h"

@interface CustomLayerViewController ()

@property (nonatomic, strong) MQLayerDelegate *layerDelegate;

@end

@implementation CustomLayerViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.navigationItem.title = @"Custom Layer";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self testViewDrawRect];
    [self testLayerDelegate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testViewDrawRect
{
    MQTestView * tv = [[MQTestView alloc] init];
    [self.view addSubview:tv];
    
    tv.frame = CGRectMake(10, 10, 200, 200);
    tv.layer.backgroundColor = [UIColor orangeColor].CGColor;
    tv.opaque = NO;
    [tv.layer setNeedsDisplay];
}

- (void)testLayerDelegate
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.frame = CGRectMake(10, 10, 200, 200);
    [self.view.layer addSublayer:layer];

    self.layerDelegate = [[MQLayerDelegate alloc] init];
    layer.delegate = self.layerDelegate;
    [layer setNeedsDisplay];
}


@end
