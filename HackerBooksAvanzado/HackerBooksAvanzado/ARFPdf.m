#import "ARFPdf.h"
#import "ARFBook.h"
#import "ARFCoreDataUtils.h"

@interface ARFPdf ()

// Private interface goes here.

@end

@implementation ARFPdf

+(instancetype) createPDFWithBook:(ARFBook *) book withData:(NSData *) data{
    ARFPdf *pdf = [NSEntityDescription insertNewObjectForEntityForName:[ARFPdf entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [pdf setBook:book];
    [pdf setData:data];
    return pdf;
}

@end
