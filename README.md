# Culqi iOS

#[![Latest Stable Version](https://poser.pugx.org/culqi/culqi-php/v/stable)](https://packagist.org/packages/culqi/culqi-php)
#[![Total Downloads](https://poser.pugx.org/culqi/culqi-php/downloads)](https://packagist.org/packages/culqi/culqi-php)
#[![License](https://poser.pugx.org/culqi/culqi-php/license)](https://packagist.org/packages/culqi/culqi-php)

SDK oficial de CULQI para iOS, pagos simples en tu sitio web.

> **Importante**: Hemos descontinuado el soporte a la versión 1.0 de Culqi API para centrarnos en la nueva versión. 

**Nota**: Esta biblioteca trabaja con la [v1.2](https://culqi.api-docs.io/v1.2) de Culqi API.


## Requisitos

* iOS 8.0 o superior.
* Credenciales de comercio Culqi (1).

(1) Debes registrarte [aquí](https://integ-panel.culqi.com/#/registro). Luego, crear un comercio y estando en el panel, acceder a Desarrollo > [***API Keys***](https://integ-panel.culqi.com/#/panel/comercio/desarrollo/llaves).

![alt tag](http://i.imgur.com/NhE6mS9.png)

## Test it out!

To check out the SDK in action download this repository and run pod install 

```bash
$ gem cd culqi-ios/Example
$ gem pod install 
```
Open Culqi.xcworkspace and run it!
> **Don't forget**: Change the merchant code in the CLQAppDelegate.m class  

## Instalación

Culqui-iOS SDK can be installed through [CocoaPods](http://cocoapods.org)

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like Culqi-iOS SDK in your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.0+ is required to build Culqi-iOS SDK.

#### Podfile

To integrate Culqi-iOS SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'Culqi', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manualmente

Clonar el repositorio o descargar el código fuente

```bash
$ git clone git@github.com:culqi/culqi-ios.git
```

Ahora, incluir la carpeta `Culqi"` en tu proyecto. Debes hacer el llamado correctamente a la carpeta y/o archivo dependiendo de tu estructura.

```objective-c
...
#import "Culqi.h"
...
```

## Modo de uso

Inicialmente hay que configurar la credencial `merchantCode`:

```objective-c
// Configurar tu Código de Comercio
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[Culqi sharedInstance] setMerchantCode:@"<CHANGE THIS FOR YOUR MERCHANT CODE>"];

    return YES;
}


```

### Obtén un token
Antes de crear un Cargo, Plan o un Suscripción es necesario crear un `token` de tarjeta. Dentro de esta librería se encuentra una funcionalidad para generar 'tokens', debes de generar los 'tokens' directamente desde tu aplicación en iOS, **debido a que es muy importante que los datos de tarjeta sean enviados desde el dispositivo de tus clientes directamente a los servidores de Culqi**, para no poner en riesgo información sensible.


```objective-c

CLQCard *card = [CLQCard newWithNumber:[numberFormatter numberFromString:self.txtFieldCardNumber.text]
                                   CVC:[numberFormatter numberFromString:self.txtFieldCVC.text]
                              expMonth:[numberFormatter numberFromString:self.txtFieldExpMonth.text]
                               expYear:[numberFormatter numberFromString:self.txtFieldExpYear.text]

                             firstName:self.txtFieldName.text
                              lastName:self.txtFieldLastName.text
                                email:self.txtFieldEmail.text];

[[Culqi sharedInstance] createTokenForCard:card success:^(CLQToken * _Nonnull token) {
    NSLog(@"Did create token with identifier: %@", token.identifier);
} failure:^(NSError * _Nonnull error) {
    NSLog(@"Error Creating token: %@", error.localizedDescription);
}];


```
## Documentación
¿Necesitas más información para integrar `culqi-ios`? La documentación completa se encuentra en [https://developers.culqi.com](https://developers.culqi.com)


## Licencia

MIT.
