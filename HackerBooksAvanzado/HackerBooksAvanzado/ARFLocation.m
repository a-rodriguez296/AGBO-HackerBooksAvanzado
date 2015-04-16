#import "ARFLocation.h"
#import "CoreData+MagicalRecord.h"
#import "ARFAnnotation.h"

@interface ARFLocation ()

// Private interface goes here.

@end

@implementation ARFLocation

+(instancetype) createLocationWithAnnotation:(ARFAnnotation *) annotation location:(CLLocation *) location{
    
    
    //Buscar si ya existe una entidad ARFLocation con las coordenadas que me dan por parametro
    
    NSPredicate *latitude = [NSPredicate predicateWithFormat:@"abs(%K) - abs(%lf) < 0.001",ARFLocationAttributes.latitude,location.coordinate.latitude];
    NSPredicate *longitude = [NSPredicate predicateWithFormat:@"abs(%K) - abs(%lf) < 0.001",ARFLocationAttributes.longitude, location.coordinate.longitude];
    NSPredicate *finalPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[latitude, longitude]];
    
    NSArray *foundLocations = [ARFLocation MR_findAllWithPredicate:finalPredicate];
    
    if (foundLocations.count) {
        
        //Existe una entidad
        ARFLocation *foundLocation = [foundLocations lastObject];
        [foundLocation addAnnotationsObject:annotation];
        return foundLocation;
    }
    else{
       
        ARFLocation *locationEntity = [ARFLocation MR_createEntity];
        [locationEntity setLatitudeValue:location.coordinate.latitude];
        [locationEntity setLongitudeValue:location.coordinate.longitude];
        [locationEntity addAnnotationsObject:annotation];
        return locationEntity;
        
    }
}

@end
