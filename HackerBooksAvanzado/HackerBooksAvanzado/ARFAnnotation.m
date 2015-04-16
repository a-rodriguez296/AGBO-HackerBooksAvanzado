#import "ARFAnnotation.h"
#import "CoreData+MagicalRecord.h"
#import "ARFBook.h"
#import "ARFPhoto.h"
#import "ARFLocation.h"

@interface ARFAnnotation ()

// Private interface goes here.

@end

@implementation ARFAnnotation

+(instancetype) createAnnotationWithBook:(ARFBook *) book text:(NSString *) text location:(CLLocation *) location image:(UIImage *) image{
    ARFAnnotation *annotation = [ARFAnnotation MR_createEntity];
    
    //Datos necesarion
    [annotation setBook:book];
    [annotation setCreationDate:[NSDate date]];
    [annotation setModificationDate:[NSDate date]];
    
    
    //Datos opcionaes
    if (text.length>0) {
        [annotation setText:text];
    }
    
    if (location) {
        [ARFLocation createLocationWithAnnotation:annotation location:location];
    }
    
    if (image) {
        ARFPhoto *photo = [ARFPhoto createPhoto];
        [photo setImage:image];
        [annotation setImage:photo];
    }
    
    
    return annotation;
}

@end
