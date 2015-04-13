// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFLocation.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFLocationAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} ARFLocationAttributes;

extern const struct ARFLocationRelationships {
	__unsafe_unretained NSString *annotations;
} ARFLocationRelationships;

@class ARFAnnotation;

@interface ARFLocationID : NSManagedObjectID {}
@end

@interface _ARFLocation : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFLocationID* objectID;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@end

@interface _ARFLocation (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(ARFAnnotation*)value_;
- (void)removeAnnotationsObject:(ARFAnnotation*)value_;

@end

@interface _ARFLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

@end
