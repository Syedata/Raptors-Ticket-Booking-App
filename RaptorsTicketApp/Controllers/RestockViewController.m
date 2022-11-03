//
//  RestockViewController.m
//  RaptorsTicketApp
//
//  Created by Wajeeha on 2022-10-03.
//

#import "RestockViewController.h"

@interface RestockViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *resetQuantityTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *resetPickerView;
@property (nonatomic) NSInteger selectedRow;
@end

@implementation RestockViewController

-(Store *)resetVCPointerToStoreObject{
    if(_resetVCPointerToStoreObject == nil) {
        _resetVCPointerToStoreObject = [[Store alloc] init];
    }
    return _resetVCPointerToStoreObject;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedRow = 0;
    self.navigationItem.title = [self.resetVCPointerToStoreObject ticketTypeAtIndex:0];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.resetVCPointerToStoreObject numberOfInventory];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.resetVCPointerToStoreObject titleForEachItemAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedRow = row;
    self.navigationItem.title = [self.resetVCPointerToStoreObject ticketTypeAtIndex:row];
    
}
- (IBAction)CancelPressed {
    self.resetQuantityTextField.text = @"";
}


- (IBAction)OkPressed {
    NSString* qty = self.resetQuantityTextField.text;
    NSInteger quantityToUpdate = [qty integerValue];
    [self.resetVCPointerToStoreObject restockTickets:quantityToUpdate atIndex:self.selectedRow];
    [self.resetPickerView reloadAllComponents];
    self.resetQuantityTextField.text= @"";
    
}
- (IBAction)DoneRestockPressed {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
