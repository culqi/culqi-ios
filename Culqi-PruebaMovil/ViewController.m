//
//  ViewController.m
//  Culqi-PruebaMovil
//
//  Created by William Muro on 1/12/16.
//  Copyright © 2016 Culqi. All rights reserved.
//

#import "ViewController.h"
#import "CrearVenta.h"
#import "BIZPopupViewController.h"

@interface ViewController ()
@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *informacionVenta;
@property (strong, nonatomic) NSString *numeroPedido;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
       /*
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                    
                }];
    */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Pagar" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-200);
    [button addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSLog(@"Evento recibido: %@", message.body);
    
    if ([message.body isEqualToString:@"checkout_cerrado"]) {
        
        [[self viewController] dismissViewControllerAnimated:YES completion:nil];
        
        NSLog(@"Checkout Cerrado");
        
    } else {
        
        //[[self viewController] dismissViewControllerAnimated:YES completion:nil];

        //JSON Creation
        NSDictionary *dict = @{@"respuesta" : message.body};
        
        NSError *error = nil;
        NSData *json;
        
        if ([NSJSONSerialization isValidJSONObject:dict])
        {
            json = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
            
            if (json != nil && error == nil)
            {
                NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
                
                NSLog(@"JSON: %@", jsonString);
            }
        }
        
        //Create Request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"https://integ-com.culqi.com/respuesta-demo-integracion"]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:json];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        [[session dataTaskWithRequest:request
                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                        
                        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                        int code = [httpResponse statusCode];
                        NSLog(@"Respuesta ...%i", code);
                        NSLog(@"Data ...%@", data);

                        if (code == 200) {
                            
                            dispatch_async(dispatch_get_main_queue(), ^{

                            [[self viewController] dismissViewControllerAnimated:YES completion:nil];
                            
                                NSString *myString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];

                                
                            NSLog(@"dataAsString %@", myString);
                            
                            
                            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Respuesta"
                                                                                         message:myString
                                                                                        delegate:nil
                                                                               cancelButtonTitle:@"Aceptar"
                                                                               otherButtonTitles:nil];
                                    [errorAlert show];
                                
                        
                            });
                            }
                    }] resume];
        
        

        
    }
    
}

- (UIViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[UIViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (UIViewController *)responder;
}

- (void)loadPopUP {

    UIViewController *checkout_view = [[UIViewController alloc] init];
    checkout_view.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]
                                             init];
    WKUserContentController *controller = [[WKUserContentController alloc]
                                           init];
    
    // Add a script handler for the "observe" call. This is added to every frame
    // in the document (window.webkit.messageHandlers.NAME).
    
    [controller addScriptMessageHandler:self name:@"observe"];
    configuration.userContentController = controller;
    
    NSURL *jsbin = [NSURL URLWithString:[NSString stringWithFormat:@"https://integ-pago.culqi.com/api/v1/formulario/movil/1/demo/%@",_informacionVenta]];
    
    NSLog(@"URL: %@", jsbin);
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 250, 15)];
    fromLabel.text = [NSString stringWithFormat:@"Pedido: %@", _numeroPedido];
    fromLabel.numberOfLines = 1;
    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    fromLabel.clipsToBounds = YES;
    fromLabel.font = [UIFont systemFontOfSize:12];
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [UIColor darkGrayColor];
    fromLabel.textAlignment = NSTextAlignmentLeft;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 300, 360)
                                  configuration:configuration];
    _webView.scrollView.scrollEnabled = false;
    [_webView loadRequest:[NSURLRequest requestWithURL:jsbin]];
    _webView.center = CGPointMake(300/2, _webView.center.y);
    
    
    [checkout_view.view addSubview:_webView];
    //[checkout_view.view addSubview:fromLabel];

    //[[self viewController] presentViewController:checkout_view animated:YES completion:nil];
    
    BIZPopupViewController *popupViewController = [[BIZPopupViewController alloc] initWithContentViewController:checkout_view  contentSize:CGSizeMake(300, 360)];
    [self presentViewController:popupViewController animated:NO completion:nil];
}


- (void)buttonPressed:(UIButton *)button {
    
    _numeroPedido = [NSString stringWithFormat:@"%@",[NSDate date]];
    //JSON Creation
    NSDictionary *dict = @{@"numero_pedido" : _numeroPedido,
                           @"nombres" : _txtfName.text,
                           @"apellidos" : _txtfLast.text,
                           @"id_usuario_comercio" : @"culqi_demo",
                           @"moneda" : @"PEN",
                           @"descripcion" : @"Venta de prueba",
                           @"ciudad" : _txtfCity.text,
                           @"pais" : _txtfCOuntry.text,
                           @"direccion" : _txtfAddress.text,
                           @"telefono" : _txtfPhone.text,
                           @"correo_electronico" : _txtfEmail.text,
                           @"monto" : @"1000"};
    
    NSError *error = nil;
    NSData *json;
    
    if ([NSJSONSerialization isValidJSONObject:dict])
    {
        json = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        
        if (json != nil && error == nil)
        {
            NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            
            NSLog(@"JSON: %@", jsonString);
        }
    }
    
    //Create Request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://integ-com.culqi.com/venta/movil"]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:json];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                    int code = [httpResponse statusCode];
                    NSLog(@"Respuesta ...%i", code);
                    
                    if (code == 200) {
                        
                        NSLog(@"dataAsString %@", [NSString stringWithUTF8String:[data bytes]]);
                        
                        NSError *jsonError;
                        
                        NSMutableDictionary * innerJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                        
                        NSData *jsonResponse;
                        NSString *jsonResponseString;
                        
                        if ([NSJSONSerialization isValidJSONObject:innerJson])
                        {
                            jsonResponse = [NSJSONSerialization dataWithJSONObject:innerJson options:NSJSONWritingPrettyPrinted error:&error];
                            
                            if (jsonResponse != nil && error == nil)
                            {
                                jsonResponseString = [[NSString alloc] initWithData:jsonResponse encoding:NSUTF8StringEncoding];
                                
                                NSLog(@"JSON: %@", jsonResponseString);
                            }
                        }
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            NSError* err = nil;
                            // code here
                            CrearVenta* creacionVenta = [[CrearVenta alloc] initWithString:jsonResponseString error:&err];
                            
                            if(err) {
                                
                                NSLog(@"json error : %@", [jsonError localizedDescription]);
                                
                            }
                            
                            if ([creacionVenta.respuesta isEqual: @"venta_registrada"]) {
                                
                                NSLog(@"Informacion venta: %@", creacionVenta.informacion_venta);
                                
                                _informacionVenta = creacionVenta.informacion_venta;
                                
                                [self loadPopUP];
                                
                            } else {
                                
                                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                     message:creacionVenta.mensaje_respuesta
                                                                                    delegate:nil
                                                                           cancelButtonTitle:@"Aceptar"
                                                                           otherButtonTitles:nil];
                                [errorAlert show];
                            }
                        });
                        
                        
                        
                        
                        
                        
                        
                    }
                }] resume];
    

    
    NSLog(@"Boton presionado ...");
    
   

}

@end
