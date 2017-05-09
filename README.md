# Culqi iOS

SDK oficial de CULQI para iOS, pagos simples en tu sitio web.

> **Importante**: Hemos descontinuado el soporte a la versión 1.0 de Culqi API para centrarnos en la nueva versión. 

**Nota**: Esta biblioteca trabaja con la [v2.0](https://culqi.api-docs.io/v1.2) de Culqi API.


## Requisitos

* iOS 8.0 o superior.
* Credenciales de comercio Culqi (1).

(1) Debes registrarte [aquí](https://integ-panel.culqi.com/#/registro). Luego, crear un comercio y estando en el panel, acceder a Desarrollo > [***API Keys***](https://integ-panel.culqi.com/#/panel/comercio/desarrollo/llaves).

![alt tag](http://i.imgur.com/NhE6mS9.png)

## Test it out!

To see the SDK in action just download this repository and run: 

```bash
$ cd culqi-ios/Example
$ pod install 
```
Open Culqi.xcworkspace and run it!
> **Don't forget**: Change the API Key in the ViewDidLoad method of CLQViewController class  

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
pod 'Culqi', '~> 2.0'
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

Inicialmente hay que configurar el SDK colocando un API Key`:

```objective-c
// Coloca tu API Key
- (void)viewDidLoad {
[super viewDidLoad];

// We start the SDK with our API Key
[Culqi setApiKey:nil];
}


```

### Obtén un token
Antes de crear un Cargo, Plan o un Suscripción es necesario crear un `token` de tarjeta. Dentro de esta librería se encuentra una funcionalidad para generar 'tokens', debes de generar los 'tokens' directamente desde tu aplicación en iOS, **debido a que es muy importante que los datos de tarjeta sean enviados desde el dispositivo de tus clientes directamente a los servidores de Culqi**, para no poner en riesgo información sensible.


```objective-c
[[Culqi sharedInstance] createTokenWithCardNumber:self.textFieldCardNumber.text
cvv:self.textFieldCVC.text
expirationMonth:self.textFieldExpMonth.text
expirationYear:self.textFieldExpYear.text
email:self.textFieldEmail.text
metadata:nil
success:^(CLQResponseHeaders * _Nonnull responseHeaders, CLQToken * _Nonnull token) {
NSLog(@"Did create token with identifier: %@", token.identifier);
} failure:^(CLQResponseHeaders * _Nonnull responseHeaders, CLQError * _Nonnull businessError, NSError * _Nonnull error) {
NSLog(@"Error Creating token\nLocalized error: %@\nBusiness Error: %@", error.localizedDescription, businessError.merchantMessage);
}];
```
## Documentación
¿Necesitas más información para integrar `culqi-ios`? La documentación completa se encuentra en [https://developers.culqi.com](https://developers.culqi.com)

## Licencia

MIT.
