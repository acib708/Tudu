//
//  Tudu.h
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tudu : NSObject

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *nota;
@property (nonatomic)         BOOL      completado;

-(id)initWithNombre:(NSString *)nombre nota:(NSString *)nota completado:(BOOL)completado;

@end
