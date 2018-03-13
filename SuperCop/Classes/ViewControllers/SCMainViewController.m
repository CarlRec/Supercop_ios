//
//  SCMainViewController.m
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCMainViewController.h"
#import "SCSizeButton.h"
#import "SCOptionButton.h"
#import "SCUserExtension.h"
#import "SVProgressHUD.h"
#import "SCWebService.h"
#import "SCHomeViewController.h"
#import "Global.h"

@interface SCMainViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, SCHomeViewControllerDelegate>
{
    IBOutlet UIScrollView *contentsScrollView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIButton *doneButton;
    
    IBOutlet SCSizeButton *clothingSizeButton;
    IBOutlet SCSizeButton *shoeSizeButton;
    IBOutlet SCSizeButton *hatSizeButton;
    IBOutlet SCOptionButton *addCartButton;
    IBOutlet SCOptionButton *checkoutButton;
    IBOutlet SCOptionButton *keywordButton;
    
    IBOutlet UIView *keywordView;
    IBOutlet UILabel *keywordLabel;
    IBOutlet UILabel *colorLabel;
    IBOutlet UITextField *keywordTextField;
    IBOutlet UITextField *colorTextField;
    
    IBOutlet UIButton *browserButton;
    IBOutlet UIButton *autofillButton;
    
    IBOutlet UIView *sizesPickerView;
    IBOutlet UILabel *pickerTitleLabel;
    IBOutlet UIPickerView *clothingPickerView;
    IBOutlet UIPickerView *shoePickerView;
    IBOutlet UIPickerView *hatPickerView;
    
    IBOutlet UIView *menuView;
    IBOutlet UIToolbar *menuToolBar;
    
    NSArray *arrayClothingSizes;
    NSArray *arrayShoeSizes;
    NSArray *arrayHatSizes;
    
    IBOutlet UIView *paymentdelayView;
    
    IBOutlet UITextField *paymentdelayTextField;
    IBOutlet UILabel *paymentdelayLabel;
    
}
@end

@implementation SCMainViewController
@synthesize layoutConstraint;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:28];
    keywordLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    colorLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    paymentdelayLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    
    keywordTextField.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    keywordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    keywordTextField.layer.borderWidth = 1.0f;
    colorTextField.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    colorTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    colorTextField.layer.borderWidth = 1.0f;
    paymentdelayTextField.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    paymentdelayTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    paymentdelayTextField.layer.borderWidth = 1.0f;

    
    contentsScrollView.contentSize = CGSizeMake(320, 568);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sizes" ofType:@"plist"];
    NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:path];
    arrayClothingSizes = root[@"CLOTHINGSIZE"];
    arrayShoeSizes = root[@"SHOESIZE"];
    arrayHatSizes = root[@"HATSIZE"];
    
    [self loadUserExtension];
    
    CGRect frame = menuToolBar.frame;
    frame.size.height = [UIScreen mainScreen].bounds.size.height;
    menuToolBar.frame = frame;
    
    NSString *email = [[NSUserDefaults standardUserDefaults] objectForKey:@"USER_EMAIL"];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"PASS_WORD"];
    if (email != nil && password != nil)
    {
        NSUUID *UUID = [[UIDevice currentDevice] identifierForVendor];
        NSString *uuid = [[UUID UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [[SCWebService sharedInstance] loginWithUsername:email password:password uuid:uuid completion:^(NSError *error, id result) {
            if (error == nil && result != nil)
            {
                if ([result[@"success"] boolValue] == NO)
                {
                    [SVProgressHUD showErrorWithStatus:@"Password Incorrect!"];
                    [self performSegueWithIdentifier:@"SCLoginViewController" sender:nil];
                }
            }
            else
            {
                [SVProgressHUD showErrorWithStatus:@"Credentials Incorrect!"];
                [self performSegueWithIdentifier:@"SCLoginViewController" sender:nil];
            }
        }];
    }
    
    [[SCWebService sharedInstance] getJsonList:@"/mobile_stock.json" completion:^(NSError *error, id result) {
        
        if (error == nil && result != nil)
        {
            mobile_stock_list = result;
        }
    }];
    
    // Number pad show/hide
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    paymentdelayTextField.inputAccessoryView = numberToolbar;
    
}
-(void)cancelNumberPad{
    [paymentdelayTextField resignFirstResponder];
    paymentdelayTextField.text = @"";
}

-(void)doneWithNumberPad{
//    NSString *numberFromTheKeyboard = paymentdelayTextField.text;
    [paymentdelayTextField resignFirstResponder];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"SCLOGIN_INFO"] == nil)
        [self performSegueWithIdentifier:@"SCLoginViewController" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUserExtension
{
    SCUserExtension *userExtension = [SCUserExtension sharedInstance];
    clothingSizeButton.sizeString = arrayClothingSizes[userExtension.clothingSize];
    clothingSizeButton.sizeIndex = userExtension.clothingSize;
    shoeSizeButton.sizeString = arrayShoeSizes[userExtension.shoeSize];
    shoeSizeButton.sizeIndex = userExtension.shoeSize;
    hatSizeButton.sizeString = arrayHatSizes[userExtension.hatSize];
    hatSizeButton.sizeIndex = userExtension.hatSize;
    addCartButton.selected = userExtension.autoAddCart;
    checkoutButton.selected = userExtension.completeCheckout;
    keywordButton.selected = userExtension.keywordFinder;
    if (keywordButton.selected == NO)
        keywordView.hidden = YES;
    else
        keywordView.hidden = NO;
    keywordTextField.text = userExtension.keyword;
    colorTextField.text = userExtension.color;
    paymentdelayTextField.text = [NSString stringWithFormat:@"%.01f", userExtension.paymentDelaySecs];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"SCHomeViewController"])
    {
        SCHomeViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)showPickerView:(BOOL)show
{
    [sizesPickerView layoutIfNeeded];
    if(show){
      layoutConstraint.constant = 0;
    }
    else{
        layoutConstraint.constant = -1000;
    }
    [UIView animateWithDuration:0.3 animations:^{
        [sizesPickerView layoutIfNeeded];
//        CGRect frame = sizesPickerView.frame;
//        if (show == YES)
//            frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
//        else
//            frame.origin.y = [UIScreen mainScreen].bounds.size.height;
//        frame.size.width = [UIScreen mainScreen].bounds.size.width;
//        sizesPickerView.frame = frame;
    }];
}

- (void)showSettingsView:(BOOL)show
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = menuView.frame;
        if (show == YES)
            frame.origin.x = 0;
        else
            frame.origin.x = -[UIScreen mainScreen].bounds.size.width;
        menuView.frame = frame;
    }];
}

#pragma mark - IBAction
- (IBAction)doneButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)settingsButtonPressed:(id)sender
{
    if (menuView.frame.origin.x == 0)
        [self showSettingsView:NO];
    else
        [self showSettingsView:YES];
}

- (IBAction)pickerDoneButtonPressed:(id)sender
{
    [self showPickerView:NO];
}

- (IBAction)minusButtonPressed:(id)sender
{
    int index = [sender tag];
    switch (index) {
        case 10:
            clothingSizeButton.sizeIndex -= 1;
            if (clothingSizeButton.sizeIndex < 0)
                clothingSizeButton.sizeIndex = 0;
            clothingSizeButton.sizeString = arrayClothingSizes[clothingSizeButton.sizeIndex];
            [clothingPickerView selectRow:clothingSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        case 20:
            shoeSizeButton.sizeIndex -= 1;
            if (shoeSizeButton.sizeIndex < 0)
                shoeSizeButton.sizeIndex = 0;
            shoeSizeButton.sizeString = arrayShoeSizes[shoeSizeButton.sizeIndex];
            [shoePickerView selectRow:shoeSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        case 30:
            hatSizeButton.sizeIndex -= 1;
            if (hatSizeButton.sizeIndex < 0)
                hatSizeButton.sizeIndex = 0;
            hatSizeButton.sizeString = arrayHatSizes[hatSizeButton.sizeIndex];
            [hatPickerView selectRow:hatSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        default:
            break;
    }
}

- (IBAction)plusButtonPressed:(id)sender
{
    int index = [sender tag];
    switch (index) {
        case 11:
            clothingSizeButton.sizeIndex += 1;
            if (clothingSizeButton.sizeIndex >= arrayClothingSizes.count)
                clothingSizeButton.sizeIndex = arrayClothingSizes.count - 1;
            clothingSizeButton.sizeString = arrayClothingSizes[clothingSizeButton.sizeIndex];
            [clothingPickerView selectRow:clothingSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        case 21:
            shoeSizeButton.sizeIndex += 1;
            if (shoeSizeButton.sizeIndex >= arrayShoeSizes.count)
                shoeSizeButton.sizeIndex = arrayShoeSizes.count - 1;
            shoeSizeButton.sizeString = arrayShoeSizes[shoeSizeButton.sizeIndex];
            [shoePickerView selectRow:shoeSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        case 31:
            hatSizeButton.sizeIndex += 1;
            if (hatSizeButton.sizeIndex >= arrayHatSizes.count)
                hatSizeButton.sizeIndex = arrayHatSizes.count - 1;
            hatSizeButton.sizeString = arrayHatSizes[hatSizeButton.sizeIndex];
            [hatPickerView selectRow:hatSizeButton.sizeIndex inComponent:0 animated:YES];
            break;
            
        default:
            break;
    }
}

- (IBAction)clothingSizeButtonPressed:(id)sender
{
    [self showPickerView:YES];
    [clothingPickerView selectRow:clothingSizeButton.sizeIndex inComponent:0 animated:YES];
    pickerTitleLabel.text = @"CLOTHING SIZE";
    clothingPickerView.hidden = NO;
    shoePickerView.hidden = YES;
    hatPickerView.hidden = YES;
}

- (IBAction)shoeSizeButtonPressed:(id)sender
{
    [self showPickerView:YES];
    [shoePickerView selectRow:shoeSizeButton.sizeIndex inComponent:0 animated:YES];
    pickerTitleLabel.text = @"SHOE SIZE";
    clothingPickerView.hidden = YES;
    shoePickerView.hidden = NO;
    hatPickerView.hidden = YES;
}

- (IBAction)hatSizeButtonPressed:(id)sender
{
    [self showPickerView:YES];
    [hatPickerView selectRow:hatSizeButton.sizeIndex inComponent:0 animated:YES];
    pickerTitleLabel.text = @"HAT SIZE";
    clothingPickerView.hidden = YES;
    shoePickerView.hidden = YES;
    hatPickerView.hidden = NO;
}

- (IBAction)addCartButtonPressed:(id)sender
{
    UIButton *button = sender;
    [button setSelected:!button.selected];
}

- (IBAction)checkoutButtonPressed:(id)sender
{
    UIButton *button = sender;
    [button setSelected:!button.selected];
    
    if (button.selected) {
        paymentdelayView.hidden = NO;
    }
    else {
        paymentdelayView.hidden = YES;
    }
}

- (IBAction)keywordButtonPressed:(id)sender
{
    UIButton *button = sender;
    [button setSelected:!button.selected];
    if (button.selected == YES){
        //[addCartButton setSelected:addCartButton.selected];
        keywordView.hidden = NO;
    }
    else{
        //[addCartButton setSelected:NO];
        keywordView.hidden = YES;
    }
}

- (IBAction)browserButtonPressed:(id)sender
{
    SCUserExtension *userExtension = [SCUserExtension sharedInstance];
    userExtension.clothingSize = clothingSizeButton.sizeIndex;
    userExtension.strClothingSize = clothingSizeButton.sizeString;
    userExtension.shoeSize = shoeSizeButton.sizeIndex;
    userExtension.strShoeSize = shoeSizeButton.sizeString;
    userExtension.hatSize = hatSizeButton.sizeIndex;
    userExtension.strHatSize = hatSizeButton.sizeString;
    userExtension.keyword = keywordTextField.text;
    userExtension.color = colorTextField.text;
    userExtension.paymentDelaySecs = [paymentdelayTextField.text floatValue];
    
    if(keywordButton.selected){
        //addCartButton.selected = addCartButton.selected;
      //userExtension.autoAddCart = addCartButton.selected;
    }
    else{
       // addCartButton.selected = NO;
       //userExtension.autoAddCart = NO;
    }
    userExtension.autoAddCart = addCartButton.selected;
    userExtension.completeCheckout = checkoutButton.selected;
    userExtension.keywordFinder = keywordButton.selected;
    [userExtension saveUserExtension];
    
    [SVProgressHUD showSuccessWithStatus:@"Saved!"];
}

- (IBAction)autofillButtonPressed:(id)sender
{
    [self showSettingsView:NO];
    
    [self performSegueWithIdentifier:@"SCAutoFillViewController" sender:nil];
}

- (IBAction)shopButtonPressed:(id)sender
{
    [self showSettingsView:NO];
    
    [self performSegueWithIdentifier:@"SCHomeViewController" sender:nil];
}

- (IBAction)logoutButtonPressed:(id)sender
{
    [self showSettingsView:NO];
    
    [self performSegueWithIdentifier:@"SCLoginViewController" sender:nil];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SCLOGIN_INFO"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == clothingPickerView)
        return arrayClothingSizes.count;
    else if (pickerView == shoePickerView)
        return arrayShoeSizes.count;
    else
        return arrayHatSizes.count;
}

#pragma mark - UIPickerViewDelegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    CGSize rowSize = [pickerView rowSizeForComponent:0];
    if (view == nil)
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rowSize.width, rowSize.height)];
    
    UILabel *label = (UILabel*)[view viewWithTag:101];
    if (label == nil)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, rowSize.width, rowSize.height)];
        label.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:18];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
    }
    
    if (pickerView == clothingPickerView)
        label.text = arrayClothingSizes[row];
    else if (pickerView == shoePickerView)
        label.text = arrayShoeSizes[row];
    else
        label.text = arrayHatSizes[row];
    
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == clothingPickerView)
    {
        clothingSizeButton.sizeIndex = row;
        clothingSizeButton.sizeString = arrayClothingSizes[row];
    }
    else if (pickerView == shoePickerView)
    {
        shoeSizeButton.sizeIndex = row;
        shoeSizeButton.sizeString = arrayShoeSizes[row];
    }
    else
    {
        hatSizeButton.sizeIndex = row;
        hatSizeButton.sizeString = arrayHatSizes[row];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = [self.view convertRect:textField.frame fromView:textField];
    float offset = [UIScreen mainScreen].bounds.size.height - 216 - frame.size.height - 10;
    if (frame.origin.y > offset)
    {
        offset = frame.origin.y - offset+40;
        CGPoint contentOffset = contentsScrollView.contentOffset;
        contentOffset.y += offset;
        CGSize contentSize = contentsScrollView.contentSize;
        if (contentOffset.y > contentSize.height - contentsScrollView.frame.size.height)
        {
            contentsScrollView.contentSize = CGSizeMake(contentSize.width, contentSize.height + offset);
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            contentsScrollView.contentOffset = contentOffset;
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
        contentsScrollView.contentSize = CGSizeMake(320, 568);
    }];
    
    return YES;
}

#pragma mark - UIGestureRecognizer Handler
- (IBAction)handleSwipeGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self showSettingsView:NO];
    
    [self performSegueWithIdentifier:@"SCAutoFillViewController" sender:nil];
}

#pragma mark - SCHomeViewControllerDelegate
- (void)didChangeKeywordFinder
{
    keywordButton.selected = [SCUserExtension sharedInstance].keywordFinder;
    if (keywordButton.selected == NO)
        keywordView.hidden = YES;
    else
        keywordView.hidden = NO;
}

@end
