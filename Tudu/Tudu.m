//
//  Tudu.m
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import "Tudu.h"

@implementation Tudu
@synthesize nombre = _nombre, completado = _completado;

-(id)initWithNombre:(NSString *)nombre andCompletado:(BOOL)completado{
    Tudu *theTodo = [Tudu new];
    if(theTodo){
        [theTodo setNombre:nombre];
        [theTodo setCompletado:completado];
    }
    else
        [NSException raise:@"Tudu init error" format:@"Could not initialize Tudu item"];
    
    return theTodo;
}

@end
