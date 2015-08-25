// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFAnnotation.h instead.

#import <CoreData/CoreData.h>
#import "ARFKVOBaseClass.h"

extern const struct ARFAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} ARFAnnotationAttributes;

extern const struct ARFAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *location;
} ARFAnnotationRelationships;

@class ARFBook;
@class ARFPhoto;
@class ARFLocation;

@interface ARFAnnotationID : NSManagedObjectID {}
@end

@interface _ARFAnnotation : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFPhoto *image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (ARFBook*)primitiveBook;
- (void)setPrimitiveBook:(ARFBook*)value;

- (ARFPhoto*)primitiveImage;
- (void)setPrimitiveImage:(ARFPhoto*)value;

- (ARFLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(ARFLocation*)value;

@end
