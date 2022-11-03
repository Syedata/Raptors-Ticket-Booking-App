//
//  HistoryTableViewController.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-30.
//

#import "HistoryTableViewController.h"
#import "History.h"
#import "HistoryDetailViewController.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController
-(Store *)historyVCPointerToStoreObject{
    if(_historyVCPointerToStoreObject == nil) {
        _historyVCPointerToStoreObject = [[Store alloc] init];
    }
    return _historyVCPointerToStoreObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.historyVCPointerToStoreObject numberOfHistoryItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
    }
    cell.textLabel.text = [self.historyVCPointerToStoreObject historyTicketTypeAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.historyVCPointerToStoreObject historyQuantityAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Navigation


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowDetails"])
    {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        HistoryDetailViewController *hdvc = (HistoryDetailViewController *)segue.destinationViewController;
        hdvc.historyDetailVCPointerToStoreObject = [self.historyVCPointerToStoreObject histObjectAtIndex:indexPath.row];
    }
    
}

@end
