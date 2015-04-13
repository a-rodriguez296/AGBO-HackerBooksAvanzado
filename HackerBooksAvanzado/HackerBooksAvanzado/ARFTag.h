#import "_ARFTag.h"

@interface ARFTag : _ARFTag {}


+(instancetype) createTagWithName:(NSString *) name;


+(ARFTag *) checkIfTagExistsWithName:(NSString *) name;

@end
