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


#pragma mark Inherited Methods 
-(NSString *)description{
    return self.tagName;
}

@end
