//
//  ARFKVOBaseClass.m
//  Hacker Books Avanzado
//
//  Created by Alejandro Rodriguez on 4/9/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFKVOBaseClass.h"
#import "ARFBook.h"

@implementation ARFKVOBaseClass

#pragma mark Class Methods
+(NSArray *)observableKeys{
    return @[];
}

+(id)uniqueObjectWithValue:(id)value
                    forKey:(NSString *)key
    inManagedObjectContext:(NSManagedObjectContext *)context{
    
    // Nos aseguramos que el contexto no sea nil para evitar errores
    // chorras
    NSParameterAssert(context);
    
    // Buscamos un objeto que tenga el valor único para la propiedad
    // especificada
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[self entityName]];
    
    req.predicate = [NSPredicate predicateWithFormat:
                     [key stringByAppendingString:@" == %@"], value];
    req.fetchLimit = 1;
    
    // Hacemos la búsqueda
    NSError *err;
    NSArray *objs = [context executeFetchRequest:req
                                           error:&err];
    
    if (!objs) {
        // error
        NSLog(@"Error searching for %@s with a key = %@ and value = %@\n\n%@\n%@",
              [self entityName], key, value, err, err.userInfo );
        return nil;
    }
    
    NSManagedObject * obj = [objs lastObject];
    
    if (!obj) {
        // No habia nada y hay que crear
        obj = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                            inManagedObjectContext:context];
        [obj setValue:value
               forKey:key];
    }
    
    return obj;
}

+ (NSString*)entityName{
    [NSException raise:@"SubClassResponsability" format:@"This method souldbe implemented by some subclass, not %@", [self class]];
    return nil;
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
