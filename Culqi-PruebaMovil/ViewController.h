//
//  ViewController.h
//  Culqi-PruebaMovil
//
//  Created by William Muro on 1/12/16.
//  Copyright © 2016 Culqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKScriptMessageHandler>

@property (nonatomic,retain) IBOutlet UITextField *txtfName;
@property (nonatomic,retain) IBOutlet UITextField *txtfLast;
@property (nonatomic,retain) IBOutlet UITextField *txtfEmail;
@property (nonatomic,retain) IBOutlet UITextField *txtfPhone;
@property (nonatomic,retain) IBOutlet UITextField *txtfCity;
@property (nonatomic,retain) IBOutlet UITextField *txtfAddress;
@property (nonatomic,retain) IBOutlet UITextField *txtfCOuntry;


@end

