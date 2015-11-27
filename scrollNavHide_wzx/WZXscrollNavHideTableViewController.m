//
//  WZXscrollNavHideTableViewController.m
//  scrollNavHide_wzx
//
//  Created by wordoor－z on 15/11/27.
//  Copyright © 2015年 wzx. All rights reserved.
//

#import "WZXscrollNavHideTableViewController.h"
#define scrollviewHeight 100
#define Duration 1
@interface WZXscrollNavHideTableViewController ()
{
    BOOL _isHide;
}
@end

@implementation WZXscrollNavHideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isHide = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
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
    return 100;
}
#pragma mark --方法在此
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.contentOffset.y > scrollviewHeight)
    {
        [UIView animateWithDuration:Duration animations:^{
            self.navigationController.navigationBar.alpha = 0;
            _isHide = YES;
        }];
    }
    if (scrollView.contentOffset.y < scrollviewHeight)
    {
        [UIView animateWithDuration:Duration animations:^{
            self.navigationController.navigationBar.alpha = 1;
            _isHide = NO;
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text =@"1";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
