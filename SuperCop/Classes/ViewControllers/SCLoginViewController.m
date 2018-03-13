//
//  SCLoginViewController.m
//  SuperCop
//
//  Created by Venus on 9/5/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCLoginViewController.h"
#import "SCWebService.h"
#import "SVProgressHUD.h"

@interface SCLoginViewController () <UITextFieldDelegate>
{
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *passwordTextField;
}
@end

@implementation SCLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    emailTextField.text = @"supercopbot@gmail.com";
//    passwordTextField.text = @"lakers";
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)UUIDString
{
    NSUUID *UUID = [[UIDevice currentDevice] identifierForVendor];
    return [UUID UUIDString];
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
- (IBAction)loginButtonPressed:(id)sender
{
    [emailTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
    if (emailTextField.text.length == 0)
    {
        [[[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Please input your email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    if (passwordTextField.text.length == 0)
    {
        [[[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Please input the password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    NSString *UUIDString = [self UUIDString];
    UUIDString = [UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    [SVProgressHUD showWithStatus:@"Logging in..." maskType:SVProgressHUDMaskTypeBlack];
    [[SCWebService sharedInstance] loginWithUsername:emailTextField.text password:passwordTextField.text uuid:UUIDString completion:^(NSError *error, id result) {
        [SVProgressHUD dismiss];
        if (error == nil && result != nil)
        {
            if ([result[@"success"] boolValue] == NO)
            {
                [SVProgressHUD showErrorWithStatus:result[@"response"]];
                return;
            }
    
            [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"SCLOGIN_INFO"];
            [[NSUserDefaults standardUserDefaults] setObject:emailTextField.text forKey:@"USER_EMAIL"];
            [[NSUserDefaults standardUserDefaults] setObject:passwordTextField.text forKey:@"PASS_WORD"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
       }
        
//        [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"SCLOGIN_INFO"];
//        [[NSUserDefaults standardUserDefaults] setObject:emailTextField.text forKey:@"USER_EMAIL"];
//        [[NSUserDefaults standardUserDefaults] setObject:passwordTextField.text forKey:@"PASS_WORD"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
    }];
}

- (IBAction)forgotPasswordButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://supercopbot.com/ios/forgotpass/"]];
    //[self performSegueWithIdentifier:@"SCForgotPaswordViewController" sender:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == emailTextField)
        [passwordTextField becomeFirstResponder];
    else if (textField == passwordTextField)
        [passwordTextField resignFirstResponder];
    
    return YES;
}

@end
