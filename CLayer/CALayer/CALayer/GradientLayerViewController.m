//
//  GradientLayerViewController.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/9.
//

#import "GradientLayerViewController.h"

@interface GradientLayerViewController ()

@end

@implementation GradientLayerViewController

- (instancetype)init
{
    if(self = [super init]) {
        self.navigationItem.title = @"Gradient Layer";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(100, 100, 150, 150);
//    [layer setColors:@[
//                        (id)[UIColor yellowColor].CGColor,
//                        (id)[UIColor greenColor].CGColor,
//                        (id)[UIColor blueColor].CGColor
//                    ]];
//    [layer setLocations:@[@0.25, @0.5, @0.75]];
//    [layer setStartPoint:CGPointMake(0, 0)];
//    [layer setEndPoint:CGPointMake(1, 0)];
    
    [layer setColors:@[
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                    ]];
    [layer setLocations:@[@0.25, @0.75]];
    [layer setStartPoint:CGPointMake(0, 0)];
    [layer setEndPoint:CGPointMake(1, 0)];
    
    [self.view.layer addSublayer:layer];
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
