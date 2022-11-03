//
//  Ticket.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import "Ticket.h"

@implementation Ticket
-(instancetype)initWithTicketType:(NSString*)ticketType andQuantity:(NSInteger)quantity andPrice:(double)price
{
    self = [super init];
    if (self) {
        self.ticketType =ticketType;
        self.quantity = quantity;
        self.price = price;
    }
    return self;
    
}

-(double)calculateTotalPrice:(NSInteger)qty{
    if((self.quantity - qty) >=0) {
        self.quantity = self.quantity - qty;
        return qty * self.price;
    }
    return -1;
}
-(NSString *) description {
    return [NSString stringWithFormat:@"%@ Q:%ld P:$ %.2f",self.ticketType,self.quantity,self.price];
}
@end
