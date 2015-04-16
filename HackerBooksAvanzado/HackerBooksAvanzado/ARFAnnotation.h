#import "_ARFAnnotation.h"
@import CoreLocation;
@import UIKit.UIImage;
@class ARFBook;

@interface ARFAnnotation : _ARFAnnotation {}

+(instancetype) createAnnotationWithBook:(ARFBook *) book text:(NSString *) text location:(CLLocation *) location image:(UIImage *) image;

@end
