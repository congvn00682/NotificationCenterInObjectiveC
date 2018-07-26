//
//  MasterTableViewController.m
//  NotificationCenterInObjectiveC
//
//  Created by Vu Ngoc Cong on 7/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "MasterTableViewController.h"

@interface MasterTableViewController ()

@property NSMutableArray *namStudent;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.namStudent) {
        self.namStudent = [[NSMutableArray alloc]init];
        [self.namStudent insertObject:@"Công" atIndex:0];
        [self.namStudent insertObject:@"Thuận" atIndex:1];
        [self.namStudent insertObject:@"Dũng" atIndex:2];
        [self.namStudent insertObject:@"Luyện" atIndex:3];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(result) name:@"name" object:nil];
}

-(void)result:(NSNotification *) notification{
    NSString *name = notification.object;
    [self.namStudent insertObject:name atIndex:self.namStudent.count];
    [self.tableView reloadData];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.namStudent.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.namStudent[indexPath.row];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *detailVC;
    NSIndexPath *indexPath;
    if ((detailVC = [segue destinationViewController])) {
        if ((indexPath = [self.tableView indexPathForSelectedRow])) {
            detailVC.name = self.namStudent[indexPath.row];
        }
    }
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

@end
