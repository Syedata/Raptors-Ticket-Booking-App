//
//  HistoryDetailViewController.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-30.
//

#import "HistoryDetailViewController.h"

@interface HistoryDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *qty;
@property (weak, nonatomic) IBOutlet UILabel *totalValue;
@property (weak, nonatomic) IBOutlet UILabel *datePurchased;

@end

@implementation HistoryDetailViewController
-(History *)historyDetailVCPointerToStoreObject{
    if(_historyDetailVCPointerToStoreObject == nil) {
        _historyDetailVCPointerToStoreObject = [[History alloc] init];
    }
    return _historyDetailVCPointerToStoreObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.type.text = [self.historyDetailVCPointerToStoreObject descriptionForTicketType];
    self.qty.text = [self.historyDetailVCPointerToStoreObject descriptionForTicketQuantity];
    self.totalValue.text = [self.historyDetailVCPointerToStoreObject descriptionForTotalPrice];
    self.datePurchased.text = [self.historyDetailVCPointerToStoreObject descriptionForDate];
}


@end
