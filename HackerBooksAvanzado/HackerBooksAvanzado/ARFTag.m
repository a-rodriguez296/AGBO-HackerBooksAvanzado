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


#pragma mark Class Methods
+(ARFTag *) checkIfTagExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,name];
    return [[ARFTag MR_findAllWithPredicate:predicate]firstObject];
}


-(BOOL) isFavorite{
    return [self.tagName isEqualToString:@"Favorite"]?YES:NO;
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


#pragma mark Inherited Methods 
-(NSString *)description{
    return self.tagName;
}

@end
