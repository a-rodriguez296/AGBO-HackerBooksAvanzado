#import "ARFTag.h"
#import "CoreData+MagicalRecord.h"

@interface ARFTag ()

// Private interface goes here.

@end

@implementation ARFTag

#pragma mark Delegate Initializer
+(instancetype) createTagWithName:(NSString *) name{
    
    ARFTag *tag = [ARFTag MR_createEntity];
    [tag setTagName:name];
    return tag;
}

+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI context:(NSManagedObjectContext *) context{
    
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
        return (ARFTag *) ob;
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


#pragma mark Class Methods
+(ARFTag *) checkIfTagExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,name];
    return [[ARFTag MR_findAllWithPredicate:predicate]firstObject];
}

+(NSData *) createDataWithTag:(ARFTag *) tag{
    NSURL *uri = [tag objectID].URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}


#pragma mark Inherited Methods 
-(NSString *)description{
    return self.tagName;
}

@end
