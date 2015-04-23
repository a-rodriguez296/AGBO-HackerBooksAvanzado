#import "ARFLocation.h"
#import "ARFCoreDataUtils.h"
#import "ARFAnnotation.h"
#import "AGTCoreDataStack.h"

@interface ARFLocation ()

// Private interface goes here.

@end

@implementation ARFLocation

+(instancetype) createLocationWithAnnotation:(ARFAnnotation *) annotation location:(CLLocation *) location{
    
    
    //Buscar si ya existe una entidad ARFLocation con las coordenadas que me dan por parametro
    
    NSPredicate *latitude = [NSPredicate predicateWithFormat:@"abs(%K) - abs(%lf) < 0.001",ARFLocationAttributes.latitude,location.coordinate.latitude];
    NSPredicate *longitude = [NSPredicate predicateWithFormat:@"abs(%K) - abs(%lf) < 0.001",ARFLocationAttributes.longitude, location.coordinate.longitude];
    NSPredicate *finalPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[latitude, longitude]];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[ARFLocation entityName]];
    [request setPredicate:finalPredicate];
    NSArray *foundLocations = [[ARFCoreDataUtils model] executeFetchRequest:request errorBlock:nil];
    
    if (foundLocations.count) {
        
        //Existe una entidad
        ARFLocation *foundLocation = [foundLocations lastObject];
        [foundLocation addAnnotationsObject:annotation];
        return foundLocation;
    }
    else{
       
        ARFLocation *locationEntity = [NSEntityDescription insertNewObjectForEntityForName:[ARFLocation entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
        [locationEntity setLatitudeValue:location.coordinate.latitude];
        [locationEntity setLongitudeValue:location.coordinate.longitude];
        [locationEntity addAnnotationsObject:annotation];
        return locationEntity;
        
    }
}

@end
