//
//  Store.h
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import <Foundation/Foundation.h>
#import "History.h"

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject
-(NSInteger) numberOfInventory;
-(NSString*) titleForEachItemAtIndex:(NSInteger)index;
-(NSString*) ticketTypeAtIndex:(NSInteger)index;
-(double) buyTickets:(NSInteger)quantity atIndex:(NSInteger)index;
-(Boolean) restockTickets:(NSInteger)quantity atIndex:(NSInteger)index;
-(NSString*) historyTicketTypeAtIndex:(NSInteger)index;
-(NSString*) historyQuantityAtIndex:(NSInteger)index;
-(History*) histObjectAtIndex:(NSInteger)index;
-(NSInteger) numberOfHistoryItems;

@end

NS_ASSUME_NONNULL_END
