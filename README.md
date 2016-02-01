
# Integrando el SDK Culqi para iOS

Aceptar pagos en tu aplicación implica unos simples pasos, en esta guía los vamos a explicar.

##1.Introducción:

Este documento tiene como intención ser una Guía rápida para que puedas integrar rápidamente el Formulario de Pago de Culqi en una aplicación para iOS.

Para realizar una operación de autorización, debes realizar 2 pasos:

**Crear un Venta** --> Aquí se validará los datos del comercio y de la compra. Esta operación es realizada en el servidor de tu comercio.

**Procesar la Venta** --> Se solicitará los datos de la tarjeta y se procesará con la marca correspondiente.

Adicionalmente, se podrá realizar las siguientes operaciones desde tu servidor:
Consultar una Venta --> obtendrás el estado de la venta y sus datos.
Anular una Venta --> se procesará la anulación siempre y cuando la venta esté autorizada.

##2.Requerimientos:

Nuestro SDK es compatible con aplicaciones de iOS 7.0 y superior.

##3.Instalación:
	
#### Instalación manual
Hemos publicado el SDk como una librería estática que puedes copiar directamente sin alguna herramienta adicional.

##4. Comercio de prueba

Para facilitarle la implementación a nuestro Entorno de Integración, hemos creado un comercio de prueba denominado "Comercio Demo", el cual considera el logotipo de Culqi, asi como los siguientes datos que deberás utilizar en los próximos pasos.

  * Código de comercio: **demo**
  * Llave del comercio: **JlhLlpOB5s1aS6upiioJkmdQ0OYZ6HLS2+/o4iYO2MQ=**

Te brindamos algunas tarjetas de diferentes marcas que podrás utilizar una vez que te integres mediante del Botón de Pago Web:

Marca | Número de tarjeta | Fecha de expiración | CVV
-------------- | -------------- | -------------- | --------------
Visa | 4111 1111 1111 1111 | 09/2020 | 123
Visa | 4444 3333 2222 1111 | 09/2019 | 123
MasterCard | 5111 1111 1111 1118 | 06/2020 | 472
Amex | 3712 121212 12122 | 11/2017 | 2841
Diners | 3600 121212 1210 | 04/2018 | 964

Si necesitas alguna ayuda u orientación, puedes comunicarte con nosotros vía email a soporte@culqi.com.

##5.Configuración:

Primero, tendrás que configurar tu código de comercio. 
Recomendamos hacer esto en el método `application:didFinishLaunchingWithOptions:` del AppDelegate de tu aplicación para que quede configurado durante todo el ciclo de vida de tu aplicación.

#### Objective-C

```objective-c

// AppDelegate.m

	#import "AppDelegate.h"
	#import <Culqi/Culqi.h>

	@implementation AppDelegate
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:
	                    (NSDictionary *) launchOptions {
	
    [Culqi setCodigoComercio:@"demo"];

    [Culqi setEntorno:Culqi.integracion];

    return YES;
	
}
	@end
```

> El valor de las variable Codigo Comercio es el provisto para el "Comercio Demo". Cuando obtengas el de tu comercio, solo reemplázalo. El valor de la variable Entorno, está apuntando por defecto al Entorno de Integración de Culqi.

Estos son los parámetros de configuración:

Parámetro | Descripción
--------- | -----------
CodigoComercio | Código del comercio asignado por Culqi.
Entorno | Entorno de Culqi a la que te conectarás. 
 | `Entorno de Integración: Culqi.integracion` 
 | `Entorno de Producción: Culqi.produccion`

##6. Operación de Autorización

###6.1 Creando una venta

Este paso es para pre-registrar y validar los datos de la venta del Comercio en la Pasarela de Pagos de Culqi, antes de solicitar los datos de la tarjeta al cliente. Si la respuesta es satisfactoria se debe proseguir con el siguiente paso, caso contrario, usted debe revisar el código y mensaje de la respuesta que se le brinde.

Para crear una nueva venta debes de seguir las indicaciones encontradas en la sección Creando una venta de:
- [PHP](http://) 
- [JAVA](http://) 
- [API](http://) 

El resultado de esa operación es una cadena de información cifrada que debes de enviar a tu aplicación para poder procesar la venta y mostrar el formulario de pago, explicada a continuación.

### 6.2 Procesando una Venta

Una vez creada la venta y al recibir la información de la venta de tu servidor, debes de usar la información de venta para mostrar el formulario de pago de Culqi.

```objective-c

- (IBAction)save:(UIButton *)sender {
    [[STPAPIClient sharedClient]
     mostrarFormlario::culqi.informacion_venta
     completion:^(CLQCheckout *checkout, NSError *error) {
         if (error) {
             [self handleError:error];
         } else {
             [self enviarRespuesta:checkout.repuesta)];
         }
     }];
}
```
####a. Parámetros de envío

Nombre | Parámetro | Descripción | Tipo
--------- | --------- | ------- | -----------
Información Venta | informacion_venta | Información de la venta cifrada.  | AN

Es muy importante que entiendas que la variable `informacion_venta` se encarga de enviar la información de la venta a nuestro formulario.

En este punto, debes visualizar el formulario de pago de Culqi. Luego que el cliente ingrese los datos de la tarjeta y se procese la venta, obtendrás como respuesta una cadena de texto, que puedes leer usando la variable `checkout.respuesta` que lo encuentras en el ejemplo de código que se mostró previamente. 

La variable `checkout.respuesta` puede retornar los siguientes códigos de erspuesta si ocurre algún error:

| Código Respuesta |	Descripción Genérica |
| ---------------- | -------------------- |
| checkout_cerrado |	Cuando el usuario ha cerrado el formulario de pago.  |
| venta_expirada |	Cuando la venta ha expirado, luego de sus 10 minutos. |
| error |	Ha ocurrido un error mientras CULQI procesaba la transacción. |
| parametro_invalido |	La información enviada para cargar el formulario de pago, puede ser inválida. |
| error_comunicacion |	Ha ocurrido un error de comunicación entre Culqi y la aplicación. |

De lo contrario recibirás una cadena cifrada que contien un JSON con la información de la respuesta.

####b.Enviando la respuesta a tu servidor

Es de suma importancia que envíes el contenido de la variable "checkout.respuesta" a tus servidores para decrifrarlo usando la librería en PHP o JAVA, ya que la llave no debe ser usada en la aplicación por tu seguridad como comercio.</aside>

Una vez terminado el proceso de pago recibirás una respuesta cifrada que deberás enviar a tu servidor para que sea descifrada. 

```objective-c
- (void)enviarRespuestaMiServidor:(String *)respuesta {
    ...
}
```

####c. Descrifrando la respuesta

Una vez recibida la respuesta, puedes decifrarla utilizando la librería PHP o JAVA. La información la puedes encontrar en el punto de la documentación de las librerías en PHP y Java.

Obtendrás un JSON que contendrá los siguientes parámetros:

Nombre | Parámetro | Descripción | Tipo
--------- | ------- | ----------- | -----------
Código de Comercio | codigo_comercio | Código del comercio en Culqi. | AN
Número de Pedido | numero_pedido | Número de orden de la venta. | AN
Código de Respuesta | codigo_respuesta | Código de la respuesta.  | AN
Mensaje de Respuesta | mensaje_respuesta | Mensaje de respuesta al desarrollador. | AN
Mensaje de Respuesta Usuario | mensaje_respuesta_usuario | Mensaje de respuesta que se recomienda mostrar al usuario. | AN
ID Transacción | id_transaccion | ID de la transacción. | AN
Código Referencia | referencia_transaccion | Código de referencia de la transacción. | AN
Código Autorización | codigo_autorizacion | Código de autorización de la transacción. | AN
Marca | marca | Marca de la tarjeta usada para realizar el pago. | AN
Emisor | emisor | Banco emisor de la tarjeta usada para realizar el pago. Es referencial. | AN
País Tarjeta | pais_emisor | País de origen de la tarjeta usada para realizar el pago. Es referencial. | AN
Numero Tarjeta | numero_tarjeta | Número de la tarjeta enmascarada usada para realizar el pago. | N
Nombre Tarjeta Habiente | nombre_tarjeta_habiente | Nombre que se usó para realizar el pago. | A
Apellido Tarjeta Habiente | apellido_tarjeta_habiente | Apellido que se usó para realizar el pago. | A
`AN = Alfanumérico` 

> Almacena estos datos por cada petición que realices, y considera que los reintentos esta relacionado al mismo número de pedido, por ello usamos el parámetro de código de referencia.

####d. Códigos de respuesta

El parámetro "codigo_respuesta" puede tener los siguientes valores:

| Código Respuesta |	Descripción Genérica |
| ---------------- | -------------------- |
| ***venta_exitosa*** |	***Se ha realizado una venta de manera exitosa*** |
| comercio_invalido |	El comercio no está en condiciones de iniciar una venta |
| parametro_invalido |	Los valores de los parametros utilizados son erróneos o no tienen validez |
| expiracion_invalida |	La fecha de vencimiento de la tarjeta es inválida |
| cvv_invalido |	El código de seguridad (CVV) de la tarjeta es inválido |
| operacion_denegada |	La operación ha sido denegada por el banco que emitió la tarjeta |
| fondos_insuficientes |	La tarjeta no dispone de fondos suficientes para realizar la compra |
| contactar_emisor |	La operación ha sido denegada por el banco que emitió la tarjeta. Se sugiere que el cliente se comunique con el banco |
| error_procesamiento |	Ha ocurrido un error mientras CULQI procesaba la transacción |
| tarjeta_perdida |	La tarjeta ha sido reportada como perdida |
| tarjeta_robada |	La tarjeta ha sido reportada como robada |
| tarjeta_vencida |	La tarjeta está vencida |

> Los parámetros "mensaje_respuesta" y "mensaje_respuesta_usuario" pueden tener diferentes contenidos, con el mismo parámetro de "codigo_respuesta". Es importante que muestres al usuario el mensaje del parámetro: "mensaje_respuesta_usuario" y no el de "mensaje_respuesta".



