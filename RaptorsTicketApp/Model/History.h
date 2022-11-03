//
//  History.h
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface History : Ticket
@property (nonatomic) NSDate *date;
//-(NSString *) description;
-(NSString *) descriptionForTicketType;
-(NSString *) descriptionForTicketQuantity;
-(NSString *) descriptionForTotalPrice;
-(NSString *) descriptionForDate;
@end

NS_ASSUME_NONNULL_END
