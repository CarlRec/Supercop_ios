//
//  SCAutoFillViewController.m
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCAutoFillViewController.h"
#import "SCUserOptions.h"
#import "SVProgressHUD.h"

@interface SCAutoFillViewController () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIScrollView *contentsScrollView;
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *telephoneTextField;
    IBOutlet UITextField *address1TextField;
    IBOutlet UITextField *address2TextField;
    IBOutlet UITextField *address3TextField;
    IBOutlet UITextField *zipcodeTextField;
    IBOutlet UITextField *cityTextField;
    IBOutlet UITextField *stateTextField;
    IBOutlet UITextField *countryTextField;
    IBOutlet UITextField *cardTextField;
    IBOutlet UITextField *cardnumberTextField;
    IBOutlet UITextField *cvvTextField;
    IBOutlet UITextField *monthTextField;
    IBOutlet UITextField *yearTextField;
    
    IBOutlet UIView *pickersView;
    IBOutlet UILabel *pickerTitleLabel;
    IBOutlet UIPickerView *statesPickerView;
    IBOutlet UIPickerView *countriesPickerView;
    IBOutlet UIPickerView *cardTypesPickerView;
    IBOutlet NSLayoutConstraint *layoutConstraint;
    
    NSArray *arrayStates;
    NSArray *arrayJPStates;
    NSArray *arrayCountries;
    NSArray *arrayCardTypes;
}
@end

@implementation SCAutoFillViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSArray *)getJPStates
{
    NSURL *url = [NSURL URLWithString:@"http://www.supremenewyork.com/mobile/#checkout"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL: url];
    [request setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1" forHTTPHeaderField:@"User-Agent"];
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    NSString *markUp = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    NSString *statesString;
    NSArray *states = nil;
    if([markUp rangeOfString:@"IS_JAPAN = true"].location != NSNotFound){
        NSRange range = [markUp rangeOfString:@"var JP_STATES = ["];
        range.length = markUp.length - range.location;
        statesString = [markUp substringWithRange:range];
        
        range = [statesString rangeOfString:@"]"];
        range.length = range.location;
        range.location = 0;
        statesString = [statesString substringWithRange:range];
        statesString = [statesString stringByReplacingOccurrencesOfString:@"var JP_STATES = [" withString:@""];
        
        states = [statesString componentsSeparatedByString:@","];
        NSMutableArray *arrUpdate = [states mutableCopy];
        for(int i=0; i<[arrUpdate count]; i++){
            arrUpdate[i] = [arrUpdate[i] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        }
        states = [NSArray arrayWithArray:arrUpdate];
    }

    return states;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayJPStates = [self getJPStates];
    [monthTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [yearTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    // Do any additional setup after loading the view.
    
    arrayCardTypes = @[@"Visa", @"American Express", @"Mastercard"];
    arrayCountries = @[@"USA", @"CANADA", @"JAPANESE" ,@"UK",@"UK (N. IRELAND)",@"AUSTRIA",@"BELARUS",@"BELGIUM",@"CROATIA",@"CZECH REPUBLIC",@"DENMARK",@"ESTONIA",@"FINLAND",@"FRANCE",@"GERMANY",@"GREECE",@"HUNGARY",@"ICELAND",@"IRELAND",@"ITALY",@"LATVIA",@"LITHUANIA",@"LUXEMBOURG",@"MONACO",@"NETHERLANDS",@"NORWAY",@"POLAND",@"PORTUGAL",@"ROMANIA",@"RUSSIA",@"SLOVAKIA",@"SLOVENIA",@"SPAIN",@"SWEDEN",@"SWITZERLAND",@"TURKEY",@"UKRAINE"];
    
    contentsScrollView.contentSize = CGSizeMake(320, 750);
    
    
    [self loadUserOptions];
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    [countriesPickerView selectRow:[self searchIndex:arrayCountries key:userOptions.country] inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUserOptions
{
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    nameTextField.text = userOptions.name;
    emailTextField.text = userOptions.email;
    telephoneTextField.text = userOptions.telephone;
    address1TextField.text = userOptions.address1;
    address2TextField.text = userOptions.address2;
    address3TextField.text = userOptions.address3;
    zipcodeTextField.text = userOptions.zipcode;
    cityTextField.text = userOptions.city;
    stateTextField.text = userOptions.state;
    countryTextField.text = userOptions.country;
    cardTextField.text = userOptions.card;
    cardnumberTextField.text = userOptions.cardnumber;
    cvvTextField.text = userOptions.cvv;
    monthTextField.text = userOptions.month;
    yearTextField.text = userOptions.year;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showPickerView:(BOOL)show
{
    [self configStates];
    [pickersView layoutIfNeeded];
    if(show)
        layoutConstraint.constant = 0;
    else
        layoutConstraint.constant = -1000;
    
    [UIView animateWithDuration:0.3 animations:^{
//        CGRect frame = pickersView.frame;
//        if (show == YES)
//            frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
//        else
//            frame.origin.y = [UIScreen mainScreen].bounds.size.height;
//        pickersView.frame = frame;
        [pickersView layoutIfNeeded];
    }];
}

- (NSInteger)searchIndex:(NSArray *)array key:(NSString *)key
{
    if (key == nil || key.length == 0)
        return 0;
    
    for (int i = 0; i < array.count; i++)
    {
        NSString *item = array[i];
        if ([item isEqualToString:key])
            return i;
    }
    
    return 0;
}

- (void)configStates
{
    if ([countriesPickerView selectedRowInComponent:0] == 0)
        arrayStates = @[@"AL", @"AK", @"AS", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"DC", @"FM", @"FL", @"GA", @"GU", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MH", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"MP", @"OH", @"OK", @"OR", @"PW", @"PA", @"PR", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VI", @"VA", @"WA", @"WV", @"WI", @"WY"];
    else if([countriesPickerView selectedRowInComponent:0] == 1)
        arrayStates = @[@"AB", @"BC", @"MB", @"NB", @"NL", @"NT", @"NS", @"NU", @"ON", @"PE", @"QC", @"SK", @"YT"];
    else if([countriesPickerView selectedRowInComponent:0] == 2){
        
        if(arrayJPStates == nil){
            arrayStates = @[@" 北海道", @" 青森県", @" 岩手県", @" 宮城県", @" 秋田県", @" 山形県", @" 福島県", @" 茨城県", @" 栃木県", @" 群馬県", @" 埼玉県", @" 千葉県", @" 東京都", @" 神奈川県", @" 新潟県", @" 富山県", @" 石川県", @" 福井県", @" 山梨県", @" 長野県", @" 岐阜県", @" 静岡県", @" 愛知県", @" 三重県", @" 滋賀県", @" 京都府", @" 大阪府", @" 兵庫県", @" 奈良県", @" 和歌山県", @" 鳥取県", @" 島根県", @" 岡山県", @" 広島県", @" 山口県", @" 徳島県", @" 香川県", @" 愛媛", @" 高知県", @" 福岡県", @" 佐賀県", @" 長崎県", @" 熊本県", @" 大分県", @" 宮崎県", @" 鹿児島県", @" 沖縄県"];
        }else{
            arrayStates = arrayJPStates;
        }
        
    }
    else
        arrayStates = nil;
    
    
    [statesPickerView reloadComponent:0];
}

#pragma mark - IBAction
- (IBAction)doneButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pickerDoneButtonPressed:(id)sender
{
    [self showPickerView:NO];
}

- (IBAction)saveButtonPressed:(id)sender
{
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    userOptions.name = nameTextField.text;
    userOptions.email = emailTextField.text;
    userOptions.telephone = telephoneTextField.text;
    userOptions.address1 = address1TextField.text;
    userOptions.address2 = address2TextField.text;
    userOptions.address3 = address3TextField.text;
    userOptions.zipcode = zipcodeTextField.text;
    userOptions.city = cityTextField.text;
    userOptions.state = stateTextField.text;
    userOptions.country = countryTextField.text;
    userOptions.card = cardTextField.text;
    userOptions.cardnumber = cardnumberTextField.text;
    userOptions.cvv = cvvTextField.text;
    if ([monthTextField.text integerValue] > 0 && [monthTextField.text integerValue] <= 12)
        userOptions.month = [NSString stringWithFormat:@"%02d", [monthTextField.text integerValue]];
    userOptions.year = yearTextField.text;
    [userOptions saveUserOptions];
    
    [SVProgressHUD showSuccessWithStatus:@"Saved!"];
}

- (IBAction)handleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.3 animations:^{
        contentsScrollView.contentSize = CGSizeMake(320, 750);
    }];
}

- (IBAction)handleSwipeGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    if (textField == countryTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [countriesPickerView selectRow:[self searchIndex:arrayCountries key:userOptions.country] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"Country";
        statesPickerView.hidden = YES;
        countriesPickerView.hidden = NO;
        cardTypesPickerView.hidden = YES;
        [self.view endEditing:YES];
        return NO;
    }
    else if (textField == stateTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [statesPickerView selectRow:[self searchIndex:arrayStates key:userOptions.state] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"State";
        statesPickerView.hidden = NO;
        countriesPickerView.hidden = YES;
        cardTypesPickerView.hidden = YES;
        [self.view endEditing:YES];
        return NO;
    }
    else if (textField == cardTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [cardTypesPickerView selectRow:[self searchIndex:arrayCardTypes key:userOptions.card] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"Card Type";
        statesPickerView.hidden = YES;
        countriesPickerView.hidden = YES;
        cardTypesPickerView.hidden = NO;
        [self.view endEditing:YES];
        return NO;
    }
    
    [self showPickerView:NO];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = [self.view convertRect:textField.frame fromView:contentsScrollView];
    float offset = [UIScreen mainScreen].bounds.size.height - 216 - frame.size.height - 10;
    if (frame.origin.y > offset)
    {
        offset = (frame.origin.y - offset)+40;
        CGPoint contentOffset = contentsScrollView.contentOffset;
        contentOffset.y += offset;
        CGSize contentSize = contentsScrollView.contentSize;
        if (contentOffset.y > contentSize.height - contentsScrollView.frame.size.height)
            contentsScrollView.contentSize = CGSizeMake(contentSize.width, contentSize.height + offset);
        
        [UIView animateWithDuration:0.3 animations:^{
            contentsScrollView.contentOffset = contentOffset;
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    if (textField == nameTextField)
        [emailTextField becomeFirstResponder];
    else if (textField == emailTextField)
        [telephoneTextField becomeFirstResponder];
    else if (textField == telephoneTextField)
        [address1TextField becomeFirstResponder];
    else if (textField == address1TextField)
        [address2TextField becomeFirstResponder];
    else if (textField == address2TextField)
        [address3TextField becomeFirstResponder];
    else if(textField == address3TextField)
         [zipcodeTextField becomeFirstResponder];
    else if (textField == zipcodeTextField)
        [cityTextField becomeFirstResponder];
    else if (textField == cityTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [countriesPickerView selectRow:[self searchIndex:arrayCountries key:userOptions.country] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"Country";
        statesPickerView.hidden = YES;
        countriesPickerView.hidden = NO;
        cardTypesPickerView.hidden = YES;
    }
    else if (textField == stateTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [statesPickerView selectRow:[self searchIndex:arrayStates key:userOptions.state] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"State";
        statesPickerView.hidden = NO;
        countriesPickerView.hidden = YES;
        cardTypesPickerView.hidden = YES;
    }
    else if (textField == countryTextField)
    {
        [textField resignFirstResponder];
        [self showPickerView:YES];
        [cardTypesPickerView selectRow:[self searchIndex:arrayCardTypes key:userOptions.card] inComponent:0 animated:YES];
        [self configStates];
        pickerTitleLabel.text = @"Card Type";
        statesPickerView.hidden = YES;
        countriesPickerView.hidden = YES;
        cardTypesPickerView.hidden = NO;
    }
    else if (textField == cardTextField)
        [cardnumberTextField becomeFirstResponder];
    else if (textField == cardnumberTextField)
        [cvvTextField becomeFirstResponder];
    else if (textField == cvvTextField)
        [monthTextField becomeFirstResponder];
    else if (textField == monthTextField)
        [yearTextField becomeFirstResponder];
    else if (textField == yearTextField)
    {
        [textField resignFirstResponder];
        
        [UIView animateWithDuration:0.3 animations:^{
            contentsScrollView.contentSize = CGSizeMake(320, 750);
        }];
    }
    
    return YES;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == statesPickerView)
        return arrayStates.count;
    else if (pickerView == countriesPickerView)
        return arrayCountries.count;
    else
        return arrayCardTypes.count;
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
        label.textColor = [UIColor blackColor];
        [view addSubview:label];
    }
    
    if (pickerView == statesPickerView)
        label.text = arrayStates[row];
    else if (pickerView == countriesPickerView)
        label.text = arrayCountries[row];
    else
        label.text = arrayCardTypes[row];
    
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == statesPickerView)
    {
        [SCUserOptions sharedInstance].state = arrayStates[row];
        stateTextField.text = arrayStates[row];
    }
    else if (pickerView == countriesPickerView)
    {
        [SCUserOptions sharedInstance].country = arrayCountries[row];
        countryTextField.text = arrayCountries[row];
        stateTextField.text = @"";
        [self configStates];
    }
    else
    {
        [SCUserOptions sharedInstance].card = arrayCardTypes[row];
        cardTextField.text = arrayCardTypes[row];
    }
}
@end
