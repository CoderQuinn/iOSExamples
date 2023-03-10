//
//  MaskLayerViewController.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/9.
//

#import "MaskLayerViewController.h"

@interface MaskLayerViewController ()

@end

@implementation MaskLayerViewController

- (instancetype)init {
    if(self = [super init]) {
        self.navigationItem.title = @"Image Mask Layer";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testImageMask];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testImageMask
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"chatImage.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = CGRectMake(50, 50, 200, 250);
    [self.view addSubview:imageView];
    
    UIImageView *imageViewMask = [[UIImageView alloc] init];
    imageViewMask.image = [[UIImage imageNamed:@"imageMask.png"] stretchableImageWithLeftCapWidth:18 topCapHeight:16];
    imageViewMask.frame = imageView.bounds;
    imageView.layer.mask = imageViewMask.layer;
    
}

@end
