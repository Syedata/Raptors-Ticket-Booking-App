//
//  Store.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import "Store.h"
#import "Ticket.h"
#import "History.h"
@interface Store()
@property (nonatomic) NSMutableArray *ticketInventory;
@property (nonatomic) NSMutableArray *soldListOfPurchases;
@end
@implementation Store
-(NSMutableArray *)ticketInventory{
    if(_ticketInventory == nil) {
        _ticketInventory = [[NSMutableArray alloc] init];
        _ticketInventory = [[NSMutableArray alloc] initWithObjects:
                            [[Ticket alloc] initWithTicketType:@"Balcony" andQuantity:12 andPrice:1170],
                            [[Ticket alloc] initWithTicketType:@"Lower" andQuantity:20 andPrice:10434],
                            [[Ticket alloc] initWithTicketType:@"Courtside" andQuantity:15 andPrice:27777],nil];
    }
    return _ticketInventory;
}
-(NSMutableArray *)soldListOfPurchases{
    if(_soldListOfPurchases == nil) {
        _soldListOfPurchases = [[NSMutableArray alloc] init];
    }
    return _soldListOfPurchases;
}
-(NSString*) titleForEachItemAtIndex:(NSInteger)index{
    Ticket *ticket = [self.ticketInventory objectAtIndex:index];
    return [ticket description];
}
-(NSString*) ticketTypeAtIndex:(NSInteger)index{
    Ticket *ticketTitle = [self.ticketInventory objectAtIndex:index];
    return [NSString stringWithFormat:@"%@", ticketTitle.ticketType];
}
-(NSInteger) numberOfInventory {
    return self.ticketInventory.count;
}


-(double) buyTickets:(NSInteger)quantity atIndex:(NSInteger)index{
    if(index > -1){
        Ticket *ticketToBuy = [self.ticketInventory objectAtIndex:index];
        double totalPrice = [ticketToBuy calculateTotalPrice:quantity];
        if(totalPrice >=0){
            History *h = [[History alloc] initWithTicketType:ticketToBuy.ticketType  andQuantity:quantity andPrice:totalPrice];
            h.date = [NSDate date];
            [self.soldListOfPurchases addObject:h];
            return totalPrice;
            
        }
        
    }
    return -1;
    
}

-(NSInteger) numberOfHistoryItems {
    return self.soldListOfPurchases.count;
}

-(Boolean) restockTickets:(NSInteger)quantity atIndex:(NSInteger)index{
    if(quantity >0 && index >-1 && index < self.ticketInventory.count) {
        Ticket *t = [self.ticketInventory objectAtIndex:index];
        t.quantity = t.quantity + quantity;
        return YES;
    }
    return NO;
}

-(NSString*) historyTicketTypeAtIndex:(NSInteger)index{
    return [[self.soldListOfPurchases objectAtIndex:index]descriptionForTicketType];
}
-(NSString*) historyQuantityAtIndex:(NSInteger)index{
    return [[self.soldListOfPurchases objectAtIndex:index]descriptionForTicketQuantity];
}

-(History*) histObjectAtIndex:(NSInteger)index{
    return [self.soldListOfPurchases objectAtIndex:index];
}
@end
