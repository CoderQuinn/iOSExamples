//
//  AppDelegate.m
//  CALayer2
//
//  Created by MagicianQuentin on 2023/3/9.
//

#import "AppDelegate.h"
#import "MaskLayerViewController.h"
#import "GradientLayerViewController.h"
#import "GradientLayerMaskViewController.h"
#import "ShapeLayerViewController.h"
#import "ShapeLayerMaskViewController.h"
#import "ShapeLayerAnimationViewController.h"
#import "TextLayerViewController.h"
#import "CustomLayerViewController.h"

@interface AppDelegate ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableViewController *tableVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.tableVC.tableView.delegate = self;
    self.tableVC.tableView.dataSource = self;
    self.tableVC.edgesForExtendedLayout = UIRectEdgeNone;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.tableVC];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *title;
    switch (indexPath.row) {
        case 0:
            title = @"Image mask";
            break;
        case 1:
            title = @"CAGradientLayer";
            break;
        case 2:
            title = @"CAGradientLayer - mask";
            break;
        case 3:
            title = @"CAShapeLayer";
            break;
        case 4:
            title = @"CAShapeLayer - mask";
            break;
        case 5:
            title = @"CAShapeLayer - animation";
            break;
        case 6:
            title = @"CATextLayer";
            break;
        case 7:
            title = @"Custom Layer";
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *targetVC;
    switch (indexPath.row) {
        case 0:
            targetVC = (UIViewController *)[[MaskLayerViewController alloc] init];
            break;
        case 1:
            targetVC = (UIViewController *)[[GradientLayerViewController alloc] init];
            break;
        case 2:
            targetVC = (UIViewController *)[[GradientLayerMaskViewController alloc] init];
            break;
        case 3:
            targetVC = [(UIViewController *)[ShapeLayerViewController alloc] init];
            break;
        case 4:
            targetVC = [(UIViewController *)[ShapeLayerMaskViewController alloc] init];
            break;
        case 5:
            targetVC = [(UIViewController *)[ShapeLayerAnimationViewController alloc] init];
            break;
        case 6:
            targetVC = [(UIViewController *)[TextLayerViewController alloc] init];
            break;
        case 7:
            targetVC = [(UIViewController *)[CustomLayerViewController alloc] init];
            break;
        default:
            break;
    }
    
    if (targetVC)
    {
        [self.tableVC.navigationController pushViewController:targetVC animated:YES];
    }
    
}

@end
