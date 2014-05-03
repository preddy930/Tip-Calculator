//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Praveen Reddy on 5/2/14.
//
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTipField;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
- (IBAction)doConfirm:(id)sender;

- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)doConfirm:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.defaultTipField.text forKey:@"default_tip"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"default_tip"] != nil) {
        
        self.defaultTipField.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"default_tip"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
