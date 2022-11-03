//
//  ViewController.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-09-29.
//

#import "ViewController.h"
#import "ManagerViewController.h"
#import "Store.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (nonatomic)BOOL isNewNumber;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property (nonatomic) NSInteger selectedRow;
@property (nonatomic) BOOL isNewType;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic) Store *myStoreModel;

@end

@implementation ViewController
-(Store *)myStoreModel{
    if(_myStoreModel == nil) {
        _myStoreModel = [[Store alloc] init];
    }
    return _myStoreModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.typeLabel.text = @"Ticket Type: ";
    self.quantityLabel.text = @"";
    self.priceLabel.text = @"Total Price: ";
    self.selectedRow = 0;
    [self updateUI];
    //self.myPickerView.delegate = self;
    //self.myPickerView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self.myPickerView reloadAllComponents];
    //   self.typeLabel.text = @"Ticket Type: ";
    self.quantityLabel.text = @"";
    self.priceLabel.text = @"Total Price: ";
}
-(void)viewDidAppear:(BOOL)animated{
    [self.myPickerView reloadAllComponents];
    //   self.typeLabel.text = @"Ticket Type: ";
    self.quantityLabel.text = @"";
    self.priceLabel.text = @"Total Price: ";
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.myStoreModel numberOfInventory];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.myStoreModel titleForEachItemAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedRow = row;
    self.quantityLabel.text = @"";
    self.priceLabel.text = @"Total Price: ";
    [self updateUI];
    
}
-(void)updateUI {
    self.typeLabel.text = [NSString stringWithFormat:@"%@%@", @"Ticket Type: ", [self.myStoreModel ticketTypeAtIndex:self.selectedRow]];
}
- (IBAction)Number_Pressed:(UIButton *)sender {
    if(self.isNewNumber){
        //self.quantityLabel.text = @"";
        self.quantityLabel.text= sender.titleLabel.text;
        self.isNewNumber = NO;
    }
    else {
        self.quantityLabel.text=[NSString stringWithFormat:@"%@%@",self.quantityLabel.text,sender.titleLabel.text];
    }
    
}

- (IBAction)Buy {
    //if(self.quantityLabel.text >0){
    NSString* qty = self.quantityLabel.text;
    NSInteger quantity = [qty integerValue];
    if(quantity > 0){
        double total = [self.myStoreModel buyTickets:quantity atIndex:self.selectedRow];
        if(total >-1){
            self.priceLabel.text = [NSString stringWithFormat:@"%@%.2f",@"Total Price: $",total];
            [self.myPickerView reloadAllComponents];
            self.quantityLabel.text = @"";
        }
        else {
            self.quantityLabel.text = @"";
            self.priceLabel.text = @"Not enough available";
        }
    }
    else {
        self.quantityLabel.text = @"";
        self.priceLabel.text = @"Please enter the quantity";
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ManagerViewController *managerVc = (ManagerViewController *)segue.destinationViewController;
    managerVc.managerVcPointerToStoreObject = self.myStoreModel;
}

@end
