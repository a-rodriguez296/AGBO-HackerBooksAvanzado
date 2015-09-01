#import "ARFTag.h"
#import "ARFCoreDataUtils.h"
#import "AGTCoreDataStack.h"
#import "ARFConstants.h"
#import "ARFBookTag.h"

@interface ARFTag ()

// Private interface goes here.

@end

@implementation ARFTag


#pragma mark Delegate Initializer
+(instancetype) createTagWithName:(NSString *) name{
    
    ARFTag *tag = [ARFTag uniqueObjectWithValue:name forKey:ARFTagAttributes.tagName inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    
    if ([tag.tagName isEqualToString:kFavoriteTag]) {
        [tag setProxyForSorting:[NSString stringWithFormat:@"__%@", tag.tagName]];
    }
    else{
        [tag setProxyForSorting:tag.tagName];
    }
    
    return tag;
}

+(instancetype) favoriteTag{
    
    
    
    ARFTag *tag = [ARFTag uniqueObjectWithValue:kFavoriteTag forKey:ARFTagAttributes.tagName inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    
    if ([tag.tagName isEqualToString:kFavoriteTag]) {
        [tag setProxyForSorting:[NSString stringWithFormat:@"__%@", tag.tagName]];
    }
    else{
        [tag setProxyForSorting:tag.tagName];
    }
    
    return tag;
    
}



#pragma mark Class Methods
+(ARFTag *) checkIfTagExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,name];
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
    [req setPredicate:predicate];
    return [[[ARFCoreDataUtils model] executeFetchRequest:req errorBlock:nil] firstObject];
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


-(BOOL)isFavorite{
    return [self.tagName isEqualToString:kFavoriteTag];
}



@end
