#import "_ARFLocation.h"
@import CoreLocation;
@class ARFAnnotation;

@interface ARFLocation : _ARFLocation {}

+(instancetype) createLocationWithAnnotation:(ARFAnnotation *) annotation location:(CLLocation *) location;

@end
