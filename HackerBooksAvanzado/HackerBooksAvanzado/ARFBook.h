#import "_ARFBook.h"

@interface ARFBook : _ARFBook {}


+(instancetype) createBookWithTitle:(NSString *) title tags:(NSArray *) tagList authors:(NSArray *) authorsList aPhotoURL:(NSString *) photoURL aPDFURL:(NSString *) pdfURL;

@end
