#import "ARFTag.h"
#import "CoreData+MagicalRecord.h"

@interface ARFTag ()

// Private interface goes here.

@end

@implementation ARFTag

+(instancetype) createTagWithName:(NSString *) name{
    
    ARFTag *tag = [ARFTag MR_createEntity];
    [tag setTagName:name];
    return tag;
}


+(ARFTag *) checkIfTagExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,name];
    return [[ARFTag MR_findAllWithPredicate:predicate]firstObject];
}

@end
