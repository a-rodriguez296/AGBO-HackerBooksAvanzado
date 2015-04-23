#import "ARFAnnotation.h"
#import "ARFBook.h"
#import "ARFPhoto.h"
#import "ARFLocation.h"
#import "ARFCoreDataUtils.h"

@interface ARFAnnotation ()

// Private interface goes here.

@end

@implementation ARFAnnotation

+(instancetype) createAnnotationWithBook:(ARFBook *) book text:(NSString *) text location:(CLLocation *) location image:(UIImage *) image{
    

    ARFAnnotation *annotation = [NSEntityDescription insertNewObjectForEntityForName:[ARFAnnotation entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    
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
