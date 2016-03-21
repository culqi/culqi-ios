//
//  CrearVenta.h
//  Culqi-PruebaMovil
//
//  Created by William Muro on 1/14/16.
//  Copyright © 2016 Culqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CrearVenta : JSONModel

@property (strong, nonatomic) NSString* respuesta;
@property (strong, nonatomic) NSString* mensaje_respuesta;
@property (strong, nonatomic) NSString* informacion_venta;

@end
