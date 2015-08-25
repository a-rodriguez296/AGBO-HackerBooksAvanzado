#import "_ARFTag.h"

@interface ARFTag : _ARFTag {}

@property (nonatomic, readonly) BOOL isFavorite;

+(instancetype) createTagWithName:(NSString *) name;
+(instancetype) favoriteTag;

+(ARFTag *) checkIfTagExistsWithName:(NSString *) name;

-(NSComparisonResult) compare:(ARFTag *) tag;



@end
