//
//  HistoryTableViewController.h
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-30.
//

#import <UIKit/UIKit.h>
#import "Store.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)Store *historyVCPointerToStoreObject;
@end

NS_ASSUME_NONNULL_END
