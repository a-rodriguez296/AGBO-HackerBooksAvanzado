#import "ARFBookTags.h"
#import "ARFBook.h"
#import "ARFTag.h"
#import "CoreData+MagicalRecord.h"

@interface ARFBookTags ()

// Private interface goes here.

@end

@implementation ARFBookTags


#pragma mark Initializers
+(instancetype) createBookTagsWithBook:(ARFBook *) book withTag:(ARFTag *) tag{
    ARFBookTags *bookTag = [ARFBookTags MR_createEntity];
    
    [bookTag setBook:book];
    [bookTag setTag:tag];
    
    return bookTag;
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
        return (ARFBookTags *) ob;
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
+(NSData *) createDataWithBookTag:(ARFBookTags *) bookTags{
    NSURL *uri = [bookTags objectID].URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}

+(NSFetchedResultsController *) createFRCForTable{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
    NSSortDescriptor *sDescriptor = [NSSortDescriptor sortDescriptorWithKey:ARFTagAttributes.tagName ascending:YES selector:@selector(compare:)];
    [req setSortDescriptors:@[sDescriptor]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:ARFTagAttributes.tagName cacheName:nil];
}


#pragma mark Utils
-(NSString *)sectionTitle{
    NSString * temp = [self primitiveSectionTitle];
    if (!temp) {
        if (self.book.favoriteValue)
            return @"Favoritos";
        else{
            return self.tag.tagName;
        }
    }
    else
        return temp;
}

-(NSString *)description{
    return self.tag.tagName;
}






@end
