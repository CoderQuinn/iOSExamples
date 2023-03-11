//
//  MQTableViewController.m
//  Touch2Demo
//
//  Created by MagicianQuentin on 2023/3/11.
//

#import "MQTableViewController.h"
#import "ButtonHitTestViewController.h"
#import "ButtonPointInsideViewController.h"
#import "ButtonSubViewOutsideViewController.h"
#import "KeyboardViewController.h"

@interface MQTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MQTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *title = NULL;
    switch (indexPath.row) {
        case 0:
            title = @"Button - hitTest";
            break;
        case 1:
            title = @"Button - pointInside";
            break;
        case 2:
            title = @"Button - subView outside";
            break;
        case 3:
            title = @"keyboard";
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - tableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *targetVc;
    switch (indexPath.row) {
        case 0:
            targetVc = [[ButtonHitTestViewController alloc] init];
            break;
        case 1:
            targetVc = [[ButtonPointInsideViewController alloc] init];
            break;
            
        case 2:
            targetVc = [[ButtonSubViewOutsideViewController alloc] init];
            break;
            
        case 3:
            targetVc = [[KeyboardViewController alloc] init];
            break;
            
        default:
            break;
    }
    
    if (targetVc) {
        [self.navigationController pushViewController:targetVc animated:YES];
    }
}

@end
