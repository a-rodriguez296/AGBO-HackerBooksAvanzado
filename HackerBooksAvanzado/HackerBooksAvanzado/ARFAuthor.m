#import "ARFAuthor.h"
#import "CoreData+MagicalRecord.h"


@interface ARFAuthor ()

// Private interface goes here.

@end

@implementation ARFAuthor

#pragma mark Inicializador
+(instancetype) createAuthorWithName:(NSString *) name{
    ARFAuthor *author = [ARFAuthor MR_createEntity];
    [author setName:name];
    return author;
}

+(ARFAuthor *) checkIfAuthorExistsWithName:(NSString *) name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFAuthorAttributes.name,name];
    return [[ARFAuthor MR_findAllWithPredicate:predicate]firstObject];
}


-(NSString *)description{
    return self.name;
}

@end
