#import "ARFPdf.h"
#import "ARFBook.h"
#import "CoreData+MagicalRecord.h"

@interface ARFPdf ()

// Private interface goes here.

@end

@implementation ARFPdf

+(instancetype) createPDFWithBook:(ARFBook *) book withData:(NSData *) data{
    ARFPdf *pdf = [ARFPdf MR_createEntity];
    [pdf setBook:book];
    [pdf setData:data];
    return pdf;
}

@end
