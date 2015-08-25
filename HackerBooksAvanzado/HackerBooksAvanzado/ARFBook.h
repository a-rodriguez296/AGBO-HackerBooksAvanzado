#import "_ARFBook.h"

@interface ARFBook : _ARFBook {}


@property (nonatomic) BOOL isFavorite;

+(instancetype) createBookWithTitle:(NSString *) title tags:(NSArray *) tagList authors:(NSArray *) authorsList aPhotoURL:(NSString *) photoURL aPDFURL:(NSString *) pdfURL;



-(NSString *) normalizedTags;
-(NSString *) normalizedAuthors;

@end
