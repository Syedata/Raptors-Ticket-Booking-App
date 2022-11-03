//
//  History.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import "History.h"

@implementation History
//-(NSString *) description {
//    return [NSString stringWithFormat:@"%@ %ld",self.ticketType,self.quantity];
//}
-(NSString *) descriptionForTicketType {
    return [NSString stringWithFormat:@"Ticket Type: %@",self.ticketType];
}

-(NSString *) descriptionForTicketQuantity {
    return [NSString stringWithFormat:@"Quantity: %ld",self.quantity];
}

-(NSString *) descriptionForTotalPrice {
    return [NSString stringWithFormat:@"Total value: $%.2f",self.price];
}
-(NSString *) descriptionForDate{
    NSDate *currDate = self.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy HH:mm:ss a"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    //NSLog(@"%@",dateString);
    return [NSString stringWithFormat:@"%@",dateString];
   // return [NSString stringWithFormat:@"Purchased Date: %@",self.date];
}
@end
