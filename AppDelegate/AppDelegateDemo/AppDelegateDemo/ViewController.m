//
//  ViewController.m
//  AppDelegateDemo
//
//  Created by MagicianQuentin on 2023/2/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *iTunesLink = @"https://www.baidu.com";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink] options:nil completionHandler:^(BOOL success) {
        NSLog(@"%@", success ? @"YES" : @"NO");
    }];

}


@end
