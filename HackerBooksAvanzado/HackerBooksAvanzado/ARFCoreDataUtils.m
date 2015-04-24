//
//  ARFCoreDataContext.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/23/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFCoreDataUtils.h"
#import "AppDelegate.h"
#import "AGTCoreDataStack.h"


@implementation ARFCoreDataUtils

//Metodo para crear el contexto
+(NSManagedObjectContext *) defaultContext{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.model.context;
}

//Metodo para crear el modelo
+(AGTCoreDataStack *) model{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.model;
}


//Metodo para serializar un objecto NSManaged...
+(NSData *) createDataWithEntity:(NSManagedObject *) object{
    NSURL *uri = [object objectID].URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}


//Metodo para crear un NSManagedObject dado un NSData
+(NSManagedObject *) objectWithArchivedURIRepresentation:(NSData*)archivedURI context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *objectId = [context.persistentStoreCoordinator managedObjectIDForURIRepresentation:uri];
    if (objectId == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:objectId];
    if (ob.isFault) {
        // Got it!
        return  ob;
    }
    else{
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
}



@end
