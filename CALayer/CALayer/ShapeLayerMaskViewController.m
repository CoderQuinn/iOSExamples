//
//  ShapeLayerMaskViewController.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "ShapeLayerMaskViewController.h"

@interface ShapeLayerMaskViewController ()

@end

@implementation ShapeLayerMaskViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.navigationItem.title = @"Gradient Layer - mask";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self testShapeLayerMask];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testShapeLayerMask
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.frame = CGRectMake(50, 100, 300, 200);
    [self.view addSubview:bgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nature.jpg"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = bgView.bounds;
    [bgView addSubview:imageView];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    [maskPath moveToPoint:CGPointMake(0, 0)];
    
    CGFloat curveHeight = 50;
    CGFloat curveBeginheight = imageView.frame.size.height - curveHeight;
    [maskPath addLineToPoint:CGPointMake(0, curveBeginheight)];
    
    CGPoint curveEndPoint = CGPointMake(imageView.frame.size.width, curveBeginheight);
    CGPoint controlPoint = CGPointMake(imageView.frame.size.width / 2, imageView.frame.size.height + 20);
    [maskPath addQuadCurveToPoint:curveEndPoint controlPoint:controlPoint];
    
    [maskPath addLineToPoint:CGPointMake(imageView.frame.size.width, 0)];
    [maskPath closePath];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
//    [bgView.layer addSublayer:maskLayer];
    bgView.layer.mask = maskLayer;
}

@end
