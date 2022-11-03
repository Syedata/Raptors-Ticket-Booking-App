//
//  Ticket.h
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject
@property NSString *ticketType;
@property NSInteger quantity;
@property double price;
-(instancetype)initWithTicketType:(NSString*)ticketType andQuantity:(NSInteger)quantity andPrice:(double)price;
-(double)calculateTotalPrice:(NSInteger)quantity;
-(NSString *) description;
@end

NS_ASSUME_NONNULL_END
