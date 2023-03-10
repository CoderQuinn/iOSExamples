//
//  TextLayerViewController.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import "TextLayerViewController.h"
#import <CoreText/CTStringAttributes.h>

@interface TextLayerViewController ()

@end

@implementation TextLayerViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.navigationItem.title = @"Text Layer";
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self testTextLayer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testTextLayer
{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.backgroundColor = [UIColor orangeColor].CGColor;
    textLayer.wrapped = YES;
    textLayer.alignmentMode = kCAAlignmentLeft;
    
    UIFont *font = [UIFont systemFontOfSize:12];
    CGFontRef fontRef = CGFontCreateWithFontName((__bridge CFStringRef)font.fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    textLayer.frame = CGRectMake(50, 50, 200, 200);
    [self.view.layer addSublayer:textLayer];
    
    
    NSString *text = @"它聪明、熟悉每个用户的喜好，从海量音乐中挑选出你可能喜欢的音乐。它通过你每一次操作来记录你的口味。你提供给云音乐的信息越多，它就越了解你的音乐喜好。";
    textLayer.string = text;
    
    // rich text
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    [string addAttribute:(NSString *)kCTForegroundColorAttributeName value:(__bridge id)[UIColor yellowColor].CGColor range:NSMakeRange(1, 2)];
    [string addAttribute:(NSString *)kCTFontAttributeName value:[UIFont fontWithName:@"Arial" size:20] range:NSMakeRange(1, 2)];
    NSDictionary *attrs = @{(__bridge id)kCTUnderlineStyleAttributeName:@(kCTUnderlineStyleDouble),
                            (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blueColor].CGColor};
    [string setAttributes:attrs range:NSMakeRange(text.length - 5, 4)];
    textLayer.string = string;
}

@end
