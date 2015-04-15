#import "_ARFBookTags.h"
@class ARFBook;
@class ARFTag;

@interface ARFBookTags : _ARFBookTags {}
// Custom logic goes here.
+(instancetype) createBookTagsWithBook:(ARFBook *) book withTag:(ARFTag *) tag;

@end
