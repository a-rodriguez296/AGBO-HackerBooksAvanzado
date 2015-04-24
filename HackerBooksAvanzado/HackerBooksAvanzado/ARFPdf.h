#import "_ARFPdf.h"
@class ARFBook;

@interface ARFPdf : _ARFPdf {}

+(instancetype) createPDFWithBook:(ARFBook *) book withData:(NSData *) data;
- (NSString*)filePathString;

@end
