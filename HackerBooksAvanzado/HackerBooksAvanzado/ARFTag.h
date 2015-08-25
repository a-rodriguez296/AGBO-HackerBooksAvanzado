#import "_ARFTag.h"

@interface ARFTag : _ARFTag {}


+(instancetype) createTagWithName:(NSString *) name;
+(instancetype) favoriteTag;

+(ARFTag *) checkIfTagExistsWithName:(NSString *) name;

-(NSComparisonResult) compare:(ARFTag *) tag;



@end
