// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFPhoto.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} ARFPhotoAttributes;

extern const struct ARFPhotoRelationships {
	__unsafe_unretained NSString *anotations;
	__unsafe_unretained NSString *book;
} ARFPhotoRelationships;

@class ARFAnnotation;
@class ARFBook;

@interface ARFPhotoID : NSManagedObjectID {}
@end

@interface _ARFPhoto : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *anotations;

- (NSMutableSet*)anotationsSet;

@property (nonatomic, strong) ARFBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFPhoto (AnotationsCoreDataGeneratedAccessors)
- (void)addAnotations:(NSSet*)value_;
- (void)removeAnotations:(NSSet*)value_;
- (void)addAnotationsObject:(ARFAnnotation*)value_;
- (void)removeAnotationsObject:(ARFAnnotation*)value_;

@end

@interface _ARFPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveAnotations;
- (void)setPrimitiveAnotations:(NSMutableSet*)value;

- (ARFBook*)primitiveBook;
- (void)setPrimitiveBook:(ARFBook*)value;

@end
