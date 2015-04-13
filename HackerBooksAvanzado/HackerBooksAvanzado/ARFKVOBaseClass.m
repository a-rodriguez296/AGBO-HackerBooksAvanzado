//
//  ARFKVOBaseClass.m
//  Hacker Books Avanzado
//
//  Created by Alejandro Rodriguez on 4/9/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFKVOBaseClass.h"

@implementation ARFKVOBaseClass

#pragma mark Class Methods
+(NSArray *)observableKeys{
    return @[];
}

#pragma mark -Life cycle


-(void)awakeFromFetch{
    [super awakeFromFetch];
    
    
    //Inicializar KVO
    [self setupKVO];
    
}

-(void)awakeFromInsert{
    [super awakeFromInsert];
    
    //Inicializar KVO
    [self setupKVO];
}


-(void)willTurnIntoFault{
    [super willTurnIntoFault];
    
    //Finalizar KVO
    [self tearDownKVO];
}

#pragma mark KVO

-(void) setupKVO{
    
    for (NSString *key in [[self class] observableKeys]) {

        [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:NULL];
    }
}

-(void) tearDownKVO{
    
    for (NSString *key in [[self class] observableKeys]){
        [self removeObserver:self forKeyPath:key];
    }
}


@end
