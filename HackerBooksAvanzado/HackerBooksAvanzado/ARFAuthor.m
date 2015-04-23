#import "ARFAuthor.h"
#import "ARFCoreDataUtils.h"
#import "AGTCoreDataStack.h"


@interface ARFAuthor ()

// Private interface goes here.

@end

@implementation ARFAuthor

#pragma mark Inicializador
+(instancetype) createAuthorWithName:(NSString *) name{
    ARFAuthor *author = [NSEntityDescription insertNewObjectForEntityForName:[ARFAuthor entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [author setName:name];
    return author;
}

+(ARFAuthor *) checkIfAuthorExistsWithName:(NSString *) name{
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFAuthor entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFAuthorAttributes.name,name]];
    return [[[ARFCoreDataUtils model] executeFetchRequest:req errorBlock:nil] firstObject];
}


-(NSString *)description{
    return self.name;
}

@end
