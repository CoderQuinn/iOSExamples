//
//  ViewController.m
//  AppdelegateNosence
//
//  Created by MagicianQuentin on 2023/2/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    
}

- (void)applicationEnterBackground:(NSNotification *)notification
{
    NSLog(@"got!!! %s", __FUNCTION__);
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    NSLog(@"resign!!! %s", __FUNCTION__);
}


@end
