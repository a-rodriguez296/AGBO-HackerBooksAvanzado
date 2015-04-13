#import "_ARFAuthor.h"

@interface ARFAuthor : _ARFAuthor {}

+(instancetype) createAuthorWithName:(NSString *) name;


+(ARFAuthor *) checkIfAuthorExistsWithName:(NSString *) name;

@end
