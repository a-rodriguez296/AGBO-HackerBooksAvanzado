#import "ARFTag.h"
#import "ARFCoreDataUtils.h"
#import "AGTCoreDataStack.h"
#import "ARFConstants.h"

@interface ARFTag ()

// Private interface goes here.

@end

@implementation ARFTag

#pragma mark Delegate Initializer
+(instancetype) createTagWithName:(NSString *) name{
    
    ARFTag *tag = [NSEntityDescription insertNewObjectForEntityForName:[ARFTag entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [tag setTagName:name];
    return tag;
}


#pragma mark Class Methods
+(ARFTag *) checkIfTagExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,name];
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
    [req setPredicate:predicate];
    return [[[ARFCoreDataUtils model] executeFetchRequest:req errorBlock:nil] firstObject];
}

+(NSFetchedResultsController *) createFRCForTable{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
    NSSortDescriptor *sDescriptor = [NSSortDescriptor sortDescriptorWithKey:ARFTagAttributes.tagName ascending:YES selector:@selector(compare:)];
    [req setSortDescriptors:@[sDescriptor]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[ARFCoreDataUtils defaultContext] sectionNameKeyPath:ARFTagAttributes.tagName cacheName:nil];
}

+(ARFTag *) retrieveLastSelectedTag{
    NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
    return (ARFTag *)[ARFCoreDataUtils objectWithArchivedURIRepresentation:lastObjectData context:[ARFCoreDataUtils defaultContext]];
}


#pragma mark Inherited Methods 
-(NSString *)description{
    return self.tagName;
}

-(NSComparisonResult) compare:(ARFTag *) tag{
    
    if (self == tag) {
        return NSOrderedSame;
    }
    else if ([self isFavorite]) {
        return NSOrderedAscending;
    }
    else if ([tag isFavorite]){
        return NSOrderedDescending;
    }
    else
        return [self.tagName compare:tag.tagName];
    
}


#pragma mark Utils

-(BOOL) isFavorite{
    return [self.tagName isEqualToString:@"Favorite"]?YES:NO;
}




@end
