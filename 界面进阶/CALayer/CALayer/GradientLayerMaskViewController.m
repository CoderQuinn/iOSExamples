//
//  GradientLayerMaskViewController.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/9.
//

#import "GradientLayerMaskViewController.h"

@interface GradientLayerMaskViewController ()

@end

@implementation GradientLayerMaskViewController

- (instancetype)init
{
    if(self = [super init]) {
        self.navigationItem.title = @"Gradient Layer - Mask";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testGradientLayer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testGradientLayer
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"nature.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = CGRectMake(100, 100, 150, 100);
    [self.view addSubview:imageView];
    
    // 镜像
    UIImageView *mirrorImageView = [[UIImageView alloc] init];
    mirrorImageView.image = imageView.image;
    mirrorImageView.contentMode = UIViewContentModeScaleAspectFill;
    mirrorImageView.transform = CGAffineTransformMakeScale(1, -1);
    mirrorImageView.center = CGPointMake(imageView.center.x, imageView.center.y + imageView.bounds.size.height);
    mirrorImageView.bounds = imageView.bounds;
    [self.view addSubview:mirrorImageView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    [gradientLayer setColors:@[(id)[UIColor clearColor].CGColor, (id)[UIColor colorWithWhite:0 alpha:0.4].CGColor]];
     gradientLayer.startPoint = CGPointMake(0, 0.5);
     gradientLayer.endPoint = CGPointMake(0, 1);
//     mirrorImageView.layer.mask = gradientLayer;
    imageView.layer.mask = gradientLayer;
    

}

@end
