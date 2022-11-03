//
//  ManagerViewController.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-30.
//

#import "ManagerViewController.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"history"]){
        HistoryTableViewController *hvc = (HistoryTableViewController*)segue.destinationViewController;
        hvc.historyVCPointerToStoreObject = self.managerVcPointerToStoreObject;}
    else {
        RestockViewController *rvc = (RestockViewController *)segue.destinationViewController;
        rvc.resetVCPointerToStoreObject = self.managerVcPointerToStoreObject;
    }
    
}

@end
