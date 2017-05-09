//
//  CLQViewController.m
//  Culqi
//
//  Created by Guillermo Sáenz on 09/18/2016.
//  Copyright (c) 2016 Guillermo Sáenz. All rights reserved.
//

#import "CLQViewController.h"

@import Culqi;
@import SVProgressHUD;

@interface CLQViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldCardNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldExpMonth;
@property (weak, nonatomic) IBOutlet UITextField *textFieldExpYear;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCVC;

@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;

@end

@implementation CLQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // We start the SDK with our merchant code
#warning Don't forget to put your public key. Get it here: https://integ-panel.culqi.com/#/registro
    [Culqi setApiKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Test Data

- (void)setTestData {
    
    [self.textFieldCardNumber setText:@"4111111111111111"];
    [self.textFieldExpMonth setText:@"09"];
    [self.textFieldExpYear setText:@"2020"];
    [self.textFieldCVC setText:@"123"];
    
    [self.textFieldEmail setText:@"jhon@test.com"];
}

#pragma mark - Actions

- (IBAction)setTestDataAction:(id)sender {
    [self setTestData];
    [self.view endEditing:YES];
}

- (IBAction)createTokenAction:(id)sender {
    
    // TODO: validate fields
    [SVProgressHUD show];
    [[Culqi sharedInstance] createTokenWithCardNumber:self.textFieldCardNumber.text
                                                  cvv:self.textFieldCVC.text
                                      expirationMonth:self.textFieldExpMonth.text
                                       expirationYear:self.textFieldExpYear.text
                                                email:self.textFieldEmail.text
                                             metadata:nil
                                              success:^(CLQResponseHeaders * _Nonnull responseHeaders, CLQToken * _Nonnull token) {
                                                 [SVProgressHUD dismiss];
                                                 NSLog(@"Did create token with identifier: %@", token.identifier);
                                             } failure:^(CLQResponseHeaders * _Nonnull responseHeaders, CLQError * _Nonnull businessError, NSError * _Nonnull error) {
                                                 [SVProgressHUD dismiss];
                                                 NSLog(@"Error Creating token\nLocalized error: %@\nBusiness Error: %@", error.localizedDescription, businessError.merchantMessage);
                                             }];
}

@end
