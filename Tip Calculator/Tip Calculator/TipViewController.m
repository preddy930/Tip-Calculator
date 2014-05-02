//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Praveen Reddy on 5/2/14.
//
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
- (IBAction)onTap:(id)sender;
- (IBAction)updatedSegment:(id)sender;
- (IBAction)updateSegmentedControl:(id)sender;
- (void)updateValues;
//- (void)updateMarkers;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateMarkers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)updatedSegment:(id)sender {
    [self updateMarkers];
}

- (IBAction)updateSegmentedControl:(id)sender {
    
    int segments = [self.tipControl numberOfSegments];
    
    for(int i=0; i<segments; i++) {
        
        if([[self.tipControl titleForSegmentAtIndex:i] floatValue]/100 == self.tipSlider.value) {
            
            [self.tipControl setSelectedSegmentIndex:i];
        }
    }
}

- (void)updateValues {
    
    float bill = [self.billTextField.text floatValue];
    float tipAmount = (self.tipSlider.value)*bill;
    float totalAmount = bill + tipAmount;
    
    self.tipPercentageLabel.text =[NSString stringWithFormat:@"%0.2f", self.tipSlider.value * 100];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"%0.2f", totalAmount];
}

- (void)updateMarkers {
    
    self.tipSlider.value = [[self.tipControl titleForSegmentAtIndex:[self.tipControl selectedSegmentIndex]] floatValue]/100;
    
    [self updateValues];
}



@end
