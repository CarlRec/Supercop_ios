//
//  SCHomeViewController.m
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCHomeViewController.h"
#import "SCMainViewController.h"
#import "SCUserOptions.h"
#import "SCUserExtension.h"
#import "SCWebService.h"
#import "Global.h"
#define SHOPSITE_URL                    @"http://www.supremenewyork.com/shop"


#define SHOPCHECKOUT_URL                @"http://www.supremenewyork.com/mobile/#checkout"
#define SHOPCHECKOUT_URL_MOBILE         @"http://www.supremenewyork.com/#checkout"

#define SHOPPRODUCTS_URL                @"http://www.supremenewyork.com/mobile/#products"
#define SHOPPRODUCTS_URL_MOBILE         @"http://www.supremenewyork.com/#products"

#define SHOPALL_URL                     @"http://www.supremenewyork.com/mobile/shop/#all"
#define SHOPALL_URL_MOBILE              @"http://www.supremenewyork.com/shop/#all"

#define SHOPCATEGORY_URL_MOBILE         @"http://www.supremenewyork.com/mobile/#categories"
#define SHOPCATEGORY_URL                @"http://www.supremenewyork.com/#categories"


@interface SCHomeViewController () <UIWebViewDelegate>
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UIWebView *shopWebView;
    IBOutlet UIButton *keywordButton;
    IBOutlet UIButton *superCopButton;
    IBOutlet UIBarButtonItem *previousButton;
    IBOutlet UIBarButtonItem *stopButton;
    IBOutlet UIBarButtonItem *refreshButton;
    IBOutlet UIBarButtonItem *forwardButton;
    IBOutlet UIActivityIndicatorView *loadingIndicatorView;
    
    BOOL isSearchingColor;
    BOOL isFoundColor;
    BOOL waitingCheckout;
    NSInteger productIndex;
    NSInteger productStyles;
    NSInteger productCounts;
    NSString *mainPath;
    NSArray *arrayStyles;
}

@end

@implementation SCHomeViewController
@synthesize purchaseDone;
@synthesize timer;
@synthesize currentUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) reloadWebView{
       [shopWebView reload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    // Do any additional setup after loading the view.
    
    titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:24];
    
    superCopButton.layer.cornerRadius = 2.0f;
    superCopButton.layer.masksToBounds = YES;
    superCopButton.titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:24];
    
    NSURL *shopURL = [NSURL URLWithString:SHOPSITE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:shopURL];
    [shopWebView loadRequest:request];
    shopWebView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    self.navigationItem.titleView = titleLabel;
    isSearchingColor = NO;
    productIndex = 0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    if ([SCUserExtension sharedInstance].keywordFinder == YES)
        [keywordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    else
        [keywordButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
     purchaseDone = NO;
    if(timer){
        [timer invalidate];
        timer = nil;
    }
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateButtons
{
    NSLog(@"%d", shopWebView.canGoBack);
    previousButton.enabled = shopWebView.canGoBack;
    forwardButton.enabled = shopWebView.canGoForward;
    stopButton.enabled = shopWebView.loading;
    refreshButton.enabled = !shopWebView.loading;
}


- (NSString *) getCountryValue:(NSString *)name{
    if ([name isEqualToString:@"USA"]) {
        return @"US";
    }
    else if ([name isEqualToString:@"CANADA"]) {
        return @"CA";
    }
  else if([name isEqualToString:@"UK"]){
      return @"GB";
  }
  else if([name isEqualToString:@"UK (N. IRELAND)"]){
     return @"NB";
  }
  else if([name isEqualToString:@"AUSTRIA"]){
     return @"AT";
  }
  else if([name isEqualToString:@"BELARUS"]){
      return @"BY";
  }
  else if([name isEqualToString:@"BULGARIA"]){
      return @"BG";
  }
  else if([name isEqualToString:@"BELGIUM"]){
     return @"BE";
  }
  else if([name isEqualToString:@"CROATIA"]){
     return @"HR";
  }
  else if([name isEqualToString:@"CZECH REPUBLIC"]){
     return @"CZ";
  }
  else if([name isEqualToString:@"DENMARK"]){
     return @"DK";
  }
  else if([name isEqualToString:@"ESTONIA"]){
     return @"EE";
  }
  else if([name isEqualToString:@"FINLAND"]){
     return @"FI";
  }
  else if([name isEqualToString:@"FRANCE"]){
     return @"FR";
  }
  else if([name isEqualToString:@"GERMANY"]){
      return @"DE";
  }
  else if([name isEqualToString:@"GREECE"]){
     return @"GR";
  }
  else if([name isEqualToString:@"HUNGARY"]){
     return @"HU";
  }
  else if([name isEqualToString:@"ICELAND"]){
     return @"IS";
  }
  else if([name isEqualToString:@"IRELAND"]){
     return @"IE";
  }
  else if([name isEqualToString:@"ITALY"]){
     return @"IT";
  }
  else if([name isEqualToString:@"LATVIA"]){
     return @"LV";
  }
  else if([name isEqualToString:@"LITHUANIA"]){
     return @"LT";
  }
  else if([name isEqualToString:@"LUXEMBOURG"]){
     return @"LU";
  }
  else if([name isEqualToString:@"MONACO"]){
     return @"MC";
  }
  else if([name isEqualToString:@"NETHERLANDS"]){
     return @"NL";
  }
  else if([name isEqualToString:@"NORWAY"]){
     return @"NO";
  }
  else if([name isEqualToString:@"POLAND"]){
     return @"PL";
  }
  else if([name isEqualToString:@"PORTUGAL"]){
     return @"PT";
  }
  else if([name isEqualToString:@"ROMANIA"]){
     return @"RO";
  }
  else if([name isEqualToString:@"RUSSIA"]){
     return @"RU";
  }
  else if([name isEqualToString:@"SLOVAKIA"]){
    return @"SK";
  }
  else if([name isEqualToString:@"SLOVENIA"]){
      return @"SI";
  }
  else if([name isEqualToString:@"SPAIN"]){
    return @"ES";
  }
  else if([name isEqualToString:@"SWEDEN"]){
     return @"SE";
  }
  else if([name isEqualToString:@"SWITZERLAND"]){
     return @"CH";
  }
  else if([name isEqualToString:@"TURKEY"]){
     return @"TR";
  }
  else if([name isEqualToString:@"UKRAINE"]){
    return @"UA";
  }
  return @"";
}
- (void)autoFillCheckout:(NSURL *)url{
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    NSString* individualScript;
    
    
    if (userOptions.name)
    {
//        NSString *nameScript = [NSString stringWithFormat:@"document.getElementById('order_billing_name').value=\"%@\"", userOptions.name];
//        [shopWebView stringByEvaluatingJavaScriptFromString:nameScript];
        
        NSString *labelName = @"name";
        if([userOptions.country isEqualToString:@"UK"] || [userOptions.country isEqualToString:@"UK (N. IRELAND)"] || [userOptions.country isEqualToString:@"AUSTRIA"] || [userOptions.country isEqualToString:@"BELARUS"] || [userOptions.country isEqualToString:@"BELGIUM"]  || [userOptions.country isEqualToString:@"BULGARIA"] || [userOptions.country isEqualToString:@"CROATIA"] || [userOptions.country isEqualToString:@"CZECH REPUBLIC"] || [userOptions.country isEqualToString:@"DENMARK"] || [userOptions.country isEqualToString:@"ESTONIA"] || [userOptions.country isEqualToString:@"FINLAND"] || [userOptions.country isEqualToString:@"FRANCE"] || [userOptions.country isEqualToString:@"GERMANY"] || [userOptions.country isEqualToString:@"GREECE"] || [userOptions.country isEqualToString:@"HUNGARY"] || [userOptions.country isEqualToString:@"ICELAND"] || [userOptions.country isEqualToString:@"IRELAND"] || [userOptions.country isEqualToString:@"ITALY"] || [userOptions.country isEqualToString:@"LATVIA"] || [userOptions.country isEqualToString:@"LITHUANIA"] || [userOptions.country isEqualToString:@"LUXEMBOURG"] || [userOptions.country isEqualToString:@"MONACO"] || [userOptions.country isEqualToString:@"NETHERLANDS"] || [userOptions.country isEqualToString:@"NORWAY"] || [userOptions.country isEqualToString:@"POLAND"] || [userOptions.country isEqualToString:@"PORTUGAL"] || [userOptions.country isEqualToString:@"ROMANIA"] || [userOptions.country isEqualToString:@"RUSSIA"] || [userOptions.country isEqualToString:@"SLOVAKIA"] || [userOptions.country isEqualToString:@"SLOVENIA"]||[userOptions.country isEqualToString:@"SPAIN"] || [userOptions.country isEqualToString:@"SWEDEN"] || [userOptions.country isEqualToString:@"SWITZERLAND"] || [userOptions.country isEqualToString:@"TURKEY"] || [userOptions.country isEqualToString:@"UKRAINE"]){
            labelName = @"full name";
        }
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_name').value='%@'", userOptions.name];
//         NSString *nameScript1 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent == '%@'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",labelName,userOptions.name];
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='name') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.name];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        NSArray *firstAndSecondName = [userOptions.name componentsSeparatedByString:@" "];
        
        
        individualScript = [NSString stringWithFormat:@"document.getElementsByName('credit_card[last_name]')[0].value='%@'", [firstAndSecondName objectAtIndex:0]];
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        if([firstAndSecondName count] > 1){
            individualScript = [NSString stringWithFormat:@"document.getElementsByName('credit_card[first_name]')[0].value='%@'", [firstAndSecondName objectAtIndex:1]];
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
        
        
    }
    
    if (userOptions.email)
    {
//        NSString *emailScript1 = [NSString stringWithFormat:@"document.getElementById('order_email').value=\"%@\"", userOptions.email];
//        [shopWebView stringByEvaluatingJavaScriptFromString:emailScript1];
        
//         NSString *emailScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_email').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'email'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.email];
        
//         NSString *emailScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'email'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.email];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_email').value='%@'", userOptions.email];

        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='email') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.email];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.telephone)
    {
//        NSString *telephoneScript1 = [NSString stringWithFormat:@"document.getElementById('order_tel').value=\"%@\"", userOptions.telephone];
//        [shopWebView stringByEvaluatingJavaScriptFromString:telephoneScript1];
        
        
//        NSString *telephoneScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_tel').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'tel'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.telephone];
        
//        NSString *telephoneScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'tel'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.telephone];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_tel').value='%@'", userOptions.telephone];

        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='telephone') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.telephone];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.address1)
    {
//        NSString *address1Script = [NSString stringWithFormat:@"document.getElementById('order_billing_address').value=\"%@\"", userOptions.address1];
//        [shopWebView stringByEvaluatingJavaScriptFromString:address1Script];
        
        
//        NSString *address2Script = [NSString stringWithFormat:@"if(document.getElementById('order_billing_address').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'address'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.address1];
        
//        NSString *address2Script = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'address'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.address1];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_address').value='%@'", userOptions.address1];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='address') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.address1];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    	
    if (userOptions.address2)
    {
//        NSString *address2Script = [NSString stringWithFormat:@"document.getElementById('order_billing_address_2').value=\"%@\"", userOptions.address2];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_address_2').value='%@'", userOptions.address2];

        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='address 2') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.address2];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.address3)
    {
//        NSString *address2Script = [NSString stringWithFormat:@"document.getElementById('order_billing_address_3').value=\"%@\"", userOptions.address3];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_address_3').value='%@'", userOptions.address3];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.zipcode)
    {
//        NSString *zipcodeScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_zip').value=\"%@\"", userOptions.zipcode];
//        [shopWebView stringByEvaluatingJavaScriptFromString:zipcodeScript1];
        
        NSString *labelName = @"zip";
        if([userOptions.country isEqualToString:@"UK"] || [userOptions.country isEqualToString:@"UK (N. IRELAND)"] || [userOptions.country isEqualToString:@"AUSTRIA"] || [userOptions.country isEqualToString:@"BELARUS"] || [userOptions.country isEqualToString:@"BELGIUM"]  || [userOptions.country isEqualToString:@"BULGARIA"] || [userOptions.country isEqualToString:@"CROATIA"] || [userOptions.country isEqualToString:@"CZECH REPUBLIC"] || [userOptions.country isEqualToString:@"DENMARK"] || [userOptions.country isEqualToString:@"ESTONIA"] || [userOptions.country isEqualToString:@"FINLAND"] || [userOptions.country isEqualToString:@"FRANCE"] || [userOptions.country isEqualToString:@"GERMANY"] || [userOptions.country isEqualToString:@"GREECE"] || [userOptions.country isEqualToString:@"HUNGARY"] || [userOptions.country isEqualToString:@"ICELAND"] || [userOptions.country isEqualToString:@"IRELAND"] || [userOptions.country isEqualToString:@"ITALY"] || [userOptions.country isEqualToString:@"LATVIA"] || [userOptions.country isEqualToString:@"LITHUANIA"] || [userOptions.country isEqualToString:@"LUXEMBOURG"] || [userOptions.country isEqualToString:@"MONACO"] || [userOptions.country isEqualToString:@"NETHERLANDS"] || [userOptions.country isEqualToString:@"NORWAY"] || [userOptions.country isEqualToString:@"POLAND"] || [userOptions.country isEqualToString:@"PORTUGAL"] || [userOptions.country isEqualToString:@"ROMANIA"] || [userOptions.country isEqualToString:@"RUSSIA"] || [userOptions.country isEqualToString:@"SLOVAKIA"] || [userOptions.country isEqualToString:@"SLOVENIA"]||[userOptions.country isEqualToString:@"SPAIN"] || [userOptions.country isEqualToString:@"SWEDEN"] || [userOptions.country isEqualToString:@"SWITZERLAND"] || [userOptions.country isEqualToString:@"TURKEY"] || [userOptions.country isEqualToString:@"UKRAINE"]){
            labelName = @"postcode";
        }
        
//        NSString *zipCodeScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_billing_zip').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == '%@'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",labelName,userOptions.zipcode];
        
//        NSString *zipCodeScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == '%@'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",labelName,userOptions.zipcode];
//        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_zip').value='%@'", userOptions.zipcode];
        
        individualScript = [NSString stringWithFormat:@"document.getElementsByName('order[billing_zip]')[0].value='%@'", userOptions.zipcode];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='zip') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.zipcode];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.city)
    {
//        NSString *cityScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_city').value=\"%@\"", userOptions.city];
//        [shopWebView stringByEvaluatingJavaScriptFromString:cityScript1];
        
        
//        NSString *cityScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_billing_city').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'city'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.city];
        
//         NSString *cityScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'city'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.city];
        
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_city').value='%@'", userOptions.city];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='city') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.city];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.country)
    {
        if([userOptions.country isEqualToString:@"UK"] || [userOptions.country isEqualToString:@"UK (N. IRELAND)"] || [userOptions.country isEqualToString:@"AUSTRIA"] || [userOptions.country isEqualToString:@"BELARUS"] || [userOptions.country isEqualToString:@"BELGIUM"]  || [userOptions.country isEqualToString:@"BULGARIA"] || [userOptions.country isEqualToString:@"CROATIA"] || [userOptions.country isEqualToString:@"CZECH REPUBLIC"] || [userOptions.country isEqualToString:@"DENMARK"] || [userOptions.country isEqualToString:@"ESTONIA"] || [userOptions.country isEqualToString:@"FINLAND"] || [userOptions.country isEqualToString:@"FRANCE"] || [userOptions.country isEqualToString:@"GERMANY"] || [userOptions.country isEqualToString:@"GREECE"] || [userOptions.country isEqualToString:@"HUNGARY"] || [userOptions.country isEqualToString:@"ICELAND"] || [userOptions.country isEqualToString:@"IRELAND"] || [userOptions.country isEqualToString:@"ITALY"] || [userOptions.country isEqualToString:@"LATVIA"] || [userOptions.country isEqualToString:@"LITHUANIA"] || [userOptions.country isEqualToString:@"LUXEMBOURG"] || [userOptions.country isEqualToString:@"MONACO"] || [userOptions.country isEqualToString:@"NETHERLANDS"] || [userOptions.country isEqualToString:@"NORWAY"] || [userOptions.country isEqualToString:@"POLAND"] || [userOptions.country isEqualToString:@"PORTUGAL"] || [userOptions.country isEqualToString:@"ROMANIA"] || [userOptions.country isEqualToString:@"RUSSIA"] || [userOptions.country isEqualToString:@"SLOVAKIA"] || [userOptions.country isEqualToString:@"SLOVENIA"]||[userOptions.country isEqualToString:@"SPAIN"] || [userOptions.country isEqualToString:@"SWEDEN"] || [userOptions.country isEqualToString:@"SWITZERLAND"] || [userOptions.country isEqualToString:@"TURKEY"] || [userOptions.country isEqualToString:@"UKRAINE"]){
//            NSString *countryScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_country').value=\"%@\"", [self getCountryValue:userOptions.country]];
//            [shopWebView stringByEvaluatingJavaScriptFromString:countryScript1];
            
            
//             NSString *countryScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_billing_country').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'country'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",[self getCountryValue:userOptions.country]];
            
//            NSString *individualScript = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'country'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",[self getCountryValue:userOptions.country]];
//            individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_country').value='%@'", userOptions.country];
            
//            individualScript = [NSString stringWithFormat:@"document.getElementsByName('order[billing_country]')[0].value='%@'", [self getCountryValue:userOptions.country]];
            
            individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('order_billing_country'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", [self getCountryValue:userOptions.country]];
            
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
        else{
//            NSString *countryScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_country').value=\"%@\"", userOptions.country];
//            [shopWebView stringByEvaluatingJavaScriptFromString:countryScript1];
            
//            NSString *countryScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_billing_country').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'country'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.country];
            
//             NSString *individualScript = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'country'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.country];

//            individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_country').value='%@'", userOptions.country];
            
//            individualScript = [NSString stringWithFormat:@"document.getElementsByName('order[billing_country]')[0].value='%@'", userOptions.country];
            
            individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('order_billing_country'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", userOptions.country];
            
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
    }
    
    if (userOptions.state)
    {
        if([userOptions.country isEqualToString:@"CANADA"]){
            NSString *stateScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_state').options.length = 0;var select = document.getElementById(\"order_billing_state\");opt = document.createElement(\"option\");opt.value = \"AB\";opt.textContent = \"AB\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"BC\";opt.textContent = \"BC\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"MB\";opt.textContent = \"MB\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"NB\";opt.textContent = \"NB\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"NL\";opt.textContent = \"NL\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"NT\";opt.textContent = \"NT\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"NS\";opt.textContent = \"NS\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"NU\";opt.textContent = \"NU\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"ON\";opt.textContent = \"ON\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"PE\";opt.textContent = \"PE\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"QC\";opt.textContent = \"QC\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"SK\";opt.textContent = \"SK\";select.appendChild(opt);opt = document.createElement(\"option\");opt.value = \"YT\";opt.textContent = \"YT\";select.appendChild(opt);"];
            [shopWebView stringByEvaluatingJavaScriptFromString:stateScript1];
 
        }
        
//        NSString *stateScript1 = [NSString stringWithFormat:@"document.getElementById('order_billing_state').value=\"%@\"", userOptions.state];
//        [shopWebView stringByEvaluatingJavaScriptFromString:stateScript1];
        
        
//        NSString *stateScript2 = [NSString stringWithFormat:@"if(document.getElementById('order_billing_state').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'state' || label.textContent.trim() == 'province'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.state];
        
//         NSString *stateScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'state' || label.textContent.trim() == 'province'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.state];
        individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_state').value='%@'", userOptions.state];
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('order_billing_state'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", userOptions.state];
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        if ([userOptions.country isEqualToString:@"USA"]) {
            individualScript = [NSString stringWithFormat:@"document.getElementById('order_billing_state').parentNode.parentNode.children[1].children[0].innerHTML='%@'", userOptions.state];
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
    }
    
    if (userOptions.card)
    {
        NSString *card = [userOptions.card lowercaseString];
        if([card isEqualToString:@"mastercard"])
            card = @"master";
        card = [card stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
//        NSString *cardScript1 = [NSString stringWithFormat:@"document.getElementById('credit_card_type').value=\"%@\"", card];
//        [shopWebView stringByEvaluatingJavaScriptFromString:cardScript1];
        
//        NSString *cardScript2 = [NSString stringWithFormat:@"if(document.getElementById('credit_card_type').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'type'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",card];
        
//         NSString *cardScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'type'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",card];
        
//        individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_type').value='%@'", card];
        
        individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('credit_card_type'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", card];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.cardnumber)
    {
//        NSString *cardnumberScript1 = [NSString stringWithFormat:@"document.getElementById('credit_card_n').value=\"%@\"", userOptions.cardnumber];
//        [shopWebView stringByEvaluatingJavaScriptFromString:cardnumberScript1];
        
//        NSString *cardnumberScript2 = [NSString stringWithFormat:@"if(document.getElementById('credit_card_n').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'number'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.cardnumber];
        
//        NSString *cardnumberScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'number'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.cardnumber];
        individualScript = [NSString stringWithFormat:@"if(document.getElementById('cn') !=null){document.getElementById('cn').value='%@';}else{document.getElementById('credit_card_n').value='%@';}", userOptions.cardnumber,userOptions.cardnumber];
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='credit card number') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.cardnumber];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.cvv)
    {
//        NSString *cvvScript1 = [NSString stringWithFormat:@"document.getElementById('credit_card_cvv').value=\"%@\"", userOptions.cvv];
//        [shopWebView stringByEvaluatingJavaScriptFromString:cvvScript1];
        
//         NSString *cvvScript2 = [NSString stringWithFormat:@"if(document.getElementById('credit_card_cvv').value == ''){var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'CVV'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}}",userOptions.cvv];
        
//        NSString *cvvScript2 = [NSString stringWithFormat:@"var labels=document.getElementsByTagName('label');for (i = 0; i < labels.length; i++){label = labels[i];if(label.textContent.trim() == 'CVV'){label.parentNode.parentNode.children[1].children[0].value = '%@';}}",userOptions.cvv];
        
//        [shopWebView stringByEvaluatingJavaScriptFromString:cvvScript2];
        
//        NSString *cvvScript = [NSString stringWithFormat:@"if(document.getElementById('credit_card_cvv').value == ''){document.getElementById('credit_card_cvv').value=\"%@\"}",userOptions.cvv];
        
        
        if ([userOptions.country isEqualToString:@"USA"]) {
            individualScript = [NSString stringWithFormat:@"document.getElementsByName('credit_card[rsusr]')[0].value='%@'", userOptions.cvv];
        }else {
            individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_cvv').value='%@';", userOptions.cvv];
        }
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        individualScript = [NSString stringWithFormat:@"var inputs=document.getElementsByTagName('input'); var cvv=''; for (var i = 0; i < inputs.length; i ++) { if (inputs[i].placeholder=='cvv') {cvv = inputs[i]; break;}} cvv.value = '%@'", userOptions.cvv];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
    }
    
    if (userOptions.month)
    {
//        NSString *monthScript = [NSString stringWithFormat:@"document.getElementById('credit_card_month').value=\"%@\"", userOptions.month];
//        individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_month').value='%@';", userOptions.month];
        
        individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('credit_card_month'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", userOptions.month];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        
        if ([userOptions.country isEqualToString:@"USA"]) {
            individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_month').parentNode.parentNode.children[1].children[0].innerHTML='%@'", userOptions.month];
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
    }
    
    if (userOptions.year)
    {
//        NSString *yearScript = [NSString stringWithFormat:@"document.getElementById('credit_card_year').value=\"%@\"", userOptions.year];
        
//        individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_year').value='%@';", userOptions.year];
        
        individualScript = [NSString stringWithFormat:@"var selectedOptionText=''; var elm=document.getElementById('credit_card_year'); for (var i = 0; i < elm.options.length; i ++) {if (elm.options[i].value == '%@') {elm.selectedIndex=i;selectedOptionText=elm.options[i].text; break;}} elm.parentNode.parentNode.children[1].children[0].innerHTML=selectedOptionText", userOptions.year];
        
        [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        
        if ([userOptions.country isEqualToString:@"USA"]) {
            individualScript = [NSString stringWithFormat:@"document.getElementById('credit_card_year').parentNode.parentNode.children[1].children[0].innerHTML='%@'", userOptions.year];
            [shopWebView stringByEvaluatingJavaScriptFromString:individualScript];
        }
    }
    
    [shopWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('style-selector').click();"]];
    NSString *termsScript = [NSString stringWithFormat:@"document.getElementById('order_terms').checked = 1;"];
    [shopWebView stringByEvaluatingJavaScriptFromString:termsScript];
    
    if ([SCUserExtension sharedInstance].completeCheckout == YES && !purchaseDone)
    {
        purchaseDone = YES;
        float paymentDelaySecs = [SCUserExtension sharedInstance].paymentDelaySecs;
        [self performSelector:@selector(submitPayment) withObject:nil afterDelay:paymentDelaySecs];
    }
}

- (void)removeGCaptcha
{
//    NSString *removeCaptcha = @"document.getElementById('g-recaptcha').remove();";
//    [shopWebView stringByEvaluatingJavaScriptFromString:removeCaptcha];
//    
//    [self performSelector:@selector(submitPayment) withObject:nil afterDelay:1.0];
}

- (void)submitPayment
{
    NSString *submitScript = [NSString stringWithFormat:@"document.getElementById('submit_button').click();"];
    [shopWebView stringByEvaluatingJavaScriptFromString:submitScript];
}


- (BOOL)isInString:(NSString*)keyword fullString:(NSString*)fullString startString:(NSString*)startString endString:(NSString*)endString length:(NSInteger)length {
    NSRange range = [fullString rangeOfString:startString];
    if(range.location == NSNotFound){
        return NO;
    }
    
    NSString* contentString;
    
    if(endString == nil){
        range.location = range.location + range.length;
        range.length = length;
        contentString = [fullString substringWithRange:range];
    }else{
        range.location = range.location + range.length;
        range.length = [fullString length] - range.location;
        
        fullString = [fullString substringWithRange:range];
        
        range = [fullString rangeOfString:endString];
        range.length = range.location;
        range.location = 0;
        contentString = [fullString substringWithRange:range];
    }
    if([contentString rangeOfString:keyword].location == NSNotFound){
        return NO;
    }else{
        return YES;
    }
    
}

- (void)autoFillProducts:(NSURL *)url color:(BOOL)hasColor
{
    if(waitingCheckout == YES){
        return;
    }
    NSString *code = [shopWebView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    SCUserExtension *userExtension = [SCUserExtension sharedInstance];
    NSRange range = [code rangeOfString:@"<select id=\"size-options\" name=\"size-options\" class=\"select-widget"];
    NSInteger initValue = -1, maxValue = -1;
    NSString *selectoptions = @"";
    BOOL hasSize = NO;

    if (range.location != NSNotFound)
    {
        range.location = range.location + range.length;
        range.length = code.length - range.location;
        selectoptions = [code substringWithRange:range];
        
        range = [selectoptions rangeOfString:@"</select>"];
        range.length = range.location + range.length;
        range.location = 0;
        selectoptions = [selectoptions substringWithRange:range];
        selectoptions = [selectoptions stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        range = [selectoptions rangeOfString:@"<option value=\""];
        if (range.location != NSNotFound)
        {
            range.location = range.location + range.length;
            range.length = selectoptions.length - range.location;
            selectoptions = [selectoptions substringWithRange:range];
            initValue = [selectoptions integerValue];
            
            range = [selectoptions rangeOfString:@"\">"];
            if (range.location != NSNotFound)
            {
                range.location = range.location + range.length;
                range.length = selectoptions.length - range.location;
                selectoptions = [selectoptions substringWithRange:range];
                
                range = [selectoptions rangeOfString:@"<option value=\"" options:NSBackwardsSearch];
                if (range.location == NSNotFound)
                    maxValue = initValue;
                else
                {
                    range.location = range.location + range.length;
                    range.length = selectoptions.length - range.location;
                    NSString *lastoptions = [selectoptions substringWithRange:range];
                    maxValue = [lastoptions integerValue];
                }
                
                range = [selectoptions rangeOfString:@"</option>"];
                range.length = range.location;
                range.location = 0;
                selectoptions = [[selectoptions substringWithRange:range] lowercaseString];
                if([selectoptions isEqualToString:@"n/a"]){
                    hasSize = YES;
                }
            }
        }
    }
    
    NSLog(@"selectoptions=%@",selectoptions);
    
    if (initValue != -1 && selectoptions.length > 0)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"sizes" ofType:@"plist"];
        NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *arrayClothingSizes = root[@"CLOTHINGSIZE"];
        NSArray *arrayShoeSizes = root[@"SHOESIZE"];
        NSArray *arrayHatSizes = root[@"HATSIZE"];
        
        for (int i = 0; i < arrayClothingSizes.count; i++)
        {
            NSString *sizeString = [arrayClothingSizes[i] lowercaseString];
            if ([sizeString isEqualToString:selectoptions])
            {
                NSInteger value = initValue - i + userExtension.clothingSize;
                if (value < initValue)
                    break;
                
                if (value >= initValue && value <= maxValue){
                    NSString *nameScript = [NSString stringWithFormat:@"document.getElementById(\"size-options-link\").textContent=\"%@\";",userExtension.strClothingSize];
                    [shopWebView stringByEvaluatingJavaScriptFromString:nameScript];
                    
                    nameScript = [NSString stringWithFormat:@"document.getElementById('size-options').value=%d;",value];
                    
                    [shopWebView stringByEvaluatingJavaScriptFromString:nameScript];
                    hasSize = YES;
                    break;
                }
            }
        }
        
        if (hasSize == NO)
        {
            NSString *_selectSize = [selectoptions stringByReplacingOccurrencesOfString:@" " withString:@""];
            for (int i = 0; i < arrayShoeSizes.count; i++)
            {
                NSString *sizeString = [arrayShoeSizes[i] lowercaseString];
                NSString *_sizeString = [sizeString stringByReplacingOccurrencesOfString:@" " withString:@""];
                if ([_sizeString isEqualToString:_selectSize])
                {
                    NSInteger value = initValue - i + userExtension.shoeSize;
                    if (value < initValue)
                        break;
                    
                    if (value >= initValue && value <= maxValue){
                        NSString *nameScript = [NSString stringWithFormat:@"document.getElementById(\"size-options-link\").textContent=\"%@\";",userExtension.strShoeSize];
                        [shopWebView stringByEvaluatingJavaScriptFromString:nameScript];
                        
                        NSString *shoeScript = [NSString stringWithFormat:@"document.getElementById('size-options').value='%d';", value];
                        
                        [shopWebView stringByEvaluatingJavaScriptFromString:shoeScript];
                        hasSize = YES;
                        break;
                    }
                }
            }
        }
        
        if (hasSize == NO)
        {
            NSString *_selectSize = [selectoptions stringByReplacingOccurrencesOfString:@" " withString:@""];
            for (int i = 0; i < arrayHatSizes.count; i++)
            {
                NSString *sizeString = [arrayHatSizes[i] lowercaseString];
                NSString *_sizeString = [sizeString stringByReplacingOccurrencesOfString:@" " withString:@""];
                if ([_sizeString isEqualToString:_selectSize])
                {
                    NSInteger value = initValue - i + userExtension.hatSize;
                    if (value < initValue)
                        break;
                    
                    if (value >= initValue && value <= maxValue){
                        NSString *nameScript = [NSString stringWithFormat:@"document.getElementById(\"size-options-link\").textContent=\"%@\";",userExtension.strHatSize];
                        [shopWebView stringByEvaluatingJavaScriptFromString:nameScript];
                        
                        NSString *hatScript = [NSString stringWithFormat:@"document.getElementById('size-options').value='%d';", value];
                        
                        [shopWebView stringByEvaluatingJavaScriptFromString:hatScript];
                        hasSize = YES;
                        break;
                    }
                }
            }
        }
    }
    SCUserOptions *userOptions = [SCUserOptions sharedInstance];
    NSString *rangeString = @"<span id=\"cart-update\"><span class=\"cart-button\">add to cart</span></span>";
    NSString *itemInCart = @"0 item in cart";
     if([userOptions.country isEqualToString:@"UK"] || [userOptions.country isEqualToString:@"UK (N. IRELAND)"] || [userOptions.country isEqualToString:@"AUSTRIA"] || [userOptions.country isEqualToString:@"BELARUS"] || [userOptions.country isEqualToString:@"BELGIUM"]  || [userOptions.country isEqualToString:@"BULGARIA"] || [userOptions.country isEqualToString:@"CROATIA"] || [userOptions.country isEqualToString:@"CZECH REPUBLIC"] || [userOptions.country isEqualToString:@"DENMARK"] || [userOptions.country isEqualToString:@"ESTONIA"] || [userOptions.country isEqualToString:@"FINLAND"] || [userOptions.country isEqualToString:@"FRANCE"] || [userOptions.country isEqualToString:@"GERMANY"] || [userOptions.country isEqualToString:@"GREECE"] || [userOptions.country isEqualToString:@"HUNGARY"] || [userOptions.country isEqualToString:@"ICELAND"] || [userOptions.country isEqualToString:@"IRELAND"] || [userOptions.country isEqualToString:@"ITALY"] || [userOptions.country isEqualToString:@"LATVIA"] || [userOptions.country isEqualToString:@"LITHUANIA"] || [userOptions.country isEqualToString:@"LUXEMBOURG"] || [userOptions.country isEqualToString:@"MONACO"] || [userOptions.country isEqualToString:@"NETHERLANDS"] || [userOptions.country isEqualToString:@"NORWAY"] || [userOptions.country isEqualToString:@"POLAND"] || [userOptions.country isEqualToString:@"PORTUGAL"] || [userOptions.country isEqualToString:@"ROMANIA"] || [userOptions.country isEqualToString:@"RUSSIA"] || [userOptions.country isEqualToString:@"SLOVAKIA"] || [userOptions.country isEqualToString:@"SLOVENIA"]||[userOptions.country isEqualToString:@"SPAIN"] || [userOptions.country isEqualToString:@"SWEDEN"] || [userOptions.country isEqualToString:@"SWITZERLAND"] || [userOptions.country isEqualToString:@"TURKEY"] || [userOptions.country isEqualToString:@"UKRAINE"]){
        rangeString = @"<span id=\"cart-update\"><span class=\"cart-button\">add to basket</span></span>";
        itemInCart = @"0 items in basket";
    }
    
    BOOL soldout = YES;
    if ([code rangeOfString:@"<span id=\"cart-update\"><span class=\"cart-button sold-out\">sold out</span></span>"].location == NSNotFound)
        soldout = NO;
    if ([code rangeOfString:rangeString].location == NSNotFound)
        soldout = YES;
    
    if([self isInString:@"sold-out" fullString:code startString:@"<span id=\"cart-update\">" endString:@"</span>" length:0]){
        soldout = YES;
    }else{
        soldout = NO;
    }
    
    BOOL addToCart = NO;
    if (userExtension.autoAddCart && soldout == NO && hasSize == YES && hasColor == YES)
    {
        
        NSString *autoAddCartScript = [NSString stringWithFormat:@"var cartButton = document.getElementById('cart-update').children[0];cartButton.click();"];
        [shopWebView stringByEvaluatingJavaScriptFromString:autoAddCartScript];
        addToCart = YES;
    }
    
    range = [code rangeOfString:itemInCart];
    if (range.location == NSNotFound && addToCart == YES)
    {
        waitingCheckout = YES;
        [self performSelector:@selector(checkout) withObject:nil afterDelay:1.2];
    }
}



- (void)checkout
{
    waitingCheckout = NO;
    NSString *checkoutScript = [NSString stringWithFormat:@"window.open('#checkout')"];
    [shopWebView stringByEvaluatingJavaScriptFromString:checkoutScript];
}

- (NSArray *)getProductStyles:(NSString *)code count:(NSInteger)count
{
    NSMutableArray *styles = [NSMutableArray array];
    NSRange range = [code rangeOfString:@"<ul id=\"style-selector\""];
    range.location = range.location + range.length;
    range.length = code.length - range.location;
    NSString *substring = [code substringWithRange:range];
    
    for (int i = 0; i < count; i++)
    {
        if([substring rangeOfString:@"<li id=\"style-"].location != NSNotFound){
            range = [substring rangeOfString:@"<li id=\"style-"];
            range.location = range.location + range.length;
            range.length = substring.length - range.location;
            substring = [substring substringWithRange:range];
            [styles addObject:@([substring integerValue])];
        }
    }
    
    return styles;
}


- (void)autoFindColor:(NSURL *)url{
    NSString *code = [shopWebView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    
    SCUserExtension *userExtension = [SCUserExtension sharedInstance];
    if(userExtension.completeCheckout == YES){
        NSString *autoAddCartScript = [NSString stringWithFormat:@"var cartButton = document.getElementById('cart-update').children[0]; cartButton.addEventListener('click', function() {setTimeout(function () {window.open('http://www.supremenewyork.com/mobile/#checkout','_self')}, 3000);}, false);"];
        //NSString *checkoutScript = [NSString stringWithFormat:@"window.open('#checkout')"];
        [shopWebView stringByEvaluatingJavaScriptFromString:autoAddCartScript];
    }
    
    NSLog(@"code=%@",code);
    BOOL hasColor = NO;
    NSString *path = [url relativeString];
    NSRange range = [path rangeOfString:@"#products/"];
    range.location = range.location + range.length;
    range.length = path.length - range.location;
    if (userExtension.keywordFinder == YES && userExtension.color)
    {
        NSRange productRange = [code rangeOfString:@"data-product-id=\""];
        productRange.location += productRange.length;
        productRange.length = 10;
        NSString *productSubstring = [code substringWithRange:productRange];
        productRange = [productSubstring rangeOfString:@"\""];
        productRange.length = productRange.location;
        productRange.location = 0;
        NSString *productID = [productSubstring substringWithRange:productRange];
        if([productID intValue] != 0){
//            [self performSelector:@selector(autoFindColor:) withObject:url afterDelay:1.8f];
//        }else{
            NSString *productJsonUrl = [NSString stringWithFormat:@"/shop/%@.json", productID];
            NSString *color = [[self removeWhiteSpaces:userExtension.color] lowercaseString];
            
            [[SCWebService sharedInstance] getJsonList:productJsonUrl completion:^(NSError *error, id product) {
                NSString *productStyleId = nil;
                if (error == nil && product != nil)
                {
                    NSArray *productStyleList = [product objectForKey:@"styles"];
                    for(NSDictionary *productStyle in productStyleList){
                        NSString *productName = [productStyle objectForKey:@"name"];
                        productName = [productName lowercaseString];
                        if([productName rangeOfString:color].location != NSNotFound){
                            productStyleId = [productStyle objectForKey:@"id"];
                            break;
                        }
                    }
                    if(productStyleId != nil){
                        [shopWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('style-%@').children[0].children[0].click();", productStyleId]];
                        isFoundColor = YES;
                        isSearchingColor = NO;
                        double delayInSeconds = 0.5;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            [self autoFillProducts:url color:YES];
                        });
                    }
                }
            }];
        }

    }
    else
    {
        isSearchingColor = NO;
        [self autoFillProducts:url color:hasColor];
        //[self performSelector:@selector(findAfterSomeTime:) withObject:url afterDelay:5];
    }

    
}

- (void) test {
    
}

- (void)autoFindKeyword:(NSURL *)url
{
    SCUserExtension *userExtension = [SCUserExtension sharedInstance];
    if (userExtension.keywordFinder == YES && userExtension.keyword.length > 0)
    {
        NSString *code = [shopWebView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML.replace(/[^\x00-\x7F]/g,'')"];
        NSRange range = [code rangeOfString:@"<div id=\"products\" class=\"section\">"];
        NSMutableArray *arrayProducts = [NSMutableArray array];
        if (range.location != NSNotFound)
        {
            range = [code rangeOfString:@"<span class=\"info\"><span class=\"name\">"];
            range.location = range.location + range.length;
            range.length = code.length - range.location;
            NSString *substring = [code substringWithRange:range];
            while (range.location != NSNotFound)
            {
                range = [substring rangeOfString:@"</span>"];
                range.length = range.location;
                range.location = 0;
                [arrayProducts addObject:[substring substringWithRange:range]];
                range = [substring rangeOfString:@"<span class=\"info\"><span class=\"name\">"];
                range.location = range.location + range.length;
                range.length = substring.length - range.location;
                if (range.location != NSNotFound)
                    substring = [substring substringWithRange:range];
            }
        }
        
        BOOL isExist = NO;
        NSString *keyword = [self removeWhiteSpaces:userExtension.keyword];
        for (int i = 0; i < arrayProducts.count; i++)
        {
            NSString *product = [arrayProducts[i] lowercaseString];
            if ([product rangeOfString:[keyword lowercaseString]].location != NSNotFound)
            {
                NSString *keywordScript = [NSString stringWithFormat:@"document.getElementById(\"products\").children[0].click();document.getElementById(\"products\").children[1].children[%d].click();", i];
                [shopWebView stringByEvaluatingJavaScriptFromString:keywordScript];
                isExist = YES;
                break;
            }
        }
        
        if (isExist == NO){
            if(timer){
                [timer invalidate];
                timer = nil;
            }
            timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(reloadWebView) userInfo:nil repeats:YES];
        }else{
            [timer invalidate];
            timer = nil;
        }
    }
}

- (NSString *)removeWhiteSpaces:(NSString *)string
{
    if (string.length == 0)
        return string;
    
    NSString *result = string;
    while ([[result substringToIndex:1] isEqualToString:@" "])
    {
        result = [result substringFromIndex:1];
    }
    
    while ([[result substringFromIndex:result.length - 1] isEqualToString:@" "])
    {
        result = [result substringToIndex:result.length - 1];
    }
    
    return result;
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

#pragma mark - IBAction
- (IBAction)keywordButtonPressed:(id)sender
{
    [SCUserExtension sharedInstance].keywordFinder = ![SCUserExtension sharedInstance].keywordFinder;
    [[SCUserExtension sharedInstance] saveUserExtension];
    
    if ([SCUserExtension sharedInstance].keywordFinder == YES)
        [keywordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    else
        [keywordButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeKeywordFinder)])
        [self.delegate didChangeKeywordFinder];
}

- (IBAction)superCopButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(waitingCheckout == YES){
        return YES;
    }
    NSString *code = [shopWebView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    NSLog(@"code=%@",code);
    NSURL *url = request.URL;
//    http://www.supremenewyork.com/mobile/#products/3748/13718
    NSLog(@"%@, %@", url.description, request.URL.scheme);
    NSString *path = [url relativeString];
    NSLog(@"code=%@",path);
    
    if ([path isEqualToString:SHOPCHECKOUT_URL] || [path isEqualToString:SHOPCHECKOUT_URL_MOBILE])
        [self performSelector:@selector(autoFillCheckout:) withObject:url afterDelay:2.0f];
    else if ([path rangeOfString:SHOPPRODUCTS_URL].location != NSNotFound || [path rangeOfString:SHOPPRODUCTS_URL_MOBILE].location != NSNotFound)
    {
        if(timer){
            [timer invalidate];
            timer = nil;
        }

        if (isSearchingColor == YES)
            [self performSelector:@selector(autoFindColor:) withObject:url afterDelay:0.5f];
        else
            [self performSelector:@selector(autoFindColor:) withObject:url afterDelay:1.8f];
    }
    else if ([path rangeOfString:SHOPALL_URL].location != NSNotFound || [path rangeOfString:SHOPALL_URL_MOBILE].location != NSNotFound)
        [self performSelector:@selector(autoFindKeyword:) withObject:url afterDelay:1.0f];
    else if ([path rangeOfString:SHOPCATEGORY_URL].location != NSNotFound || [path rangeOfString:SHOPCATEGORY_URL_MOBILE].location != NSNotFound)
    {
        purchaseDone = NO;
        isSearchingColor = NO;
        isFoundColor = NO;
        productIndex = 0;
        if ([path isEqualToString:SHOPCATEGORY_URL_MOBILE]){
            return YES;
        }
        
        [self performSelector:@selector(autoFindKeyword:) withObject:url afterDelay:1.0f];
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    loadingIndicatorView.hidden = NO;
    [loadingIndicatorView startAnimating];
    [self updateButtons];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateButtons];
    
    loadingIndicatorView.hidden = YES;
    [loadingIndicatorView stopAnimating];
    
    NSURL *url = webView.request.URL;
    NSLog(@"%@", url.description);
    NSString *path = [url relativeString];
    if ([path isEqualToString:SHOPCHECKOUT_URL] || [path isEqualToString:SHOPCHECKOUT_URL_MOBILE])
        [self performSelector:@selector(autoFillCheckout:) withObject:url afterDelay:2.0];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"failed to load");
}

@end
