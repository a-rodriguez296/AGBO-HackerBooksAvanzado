// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBookTag.h instead.

#import <CoreData/CoreData.h>
#import "ARFKVOBaseClass.h"

extern const struct ARFBookTagAttributes {
	__unsafe_unretained NSString *name;
} ARFBookTagAttributes;

extern const struct ARFBookTagRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *tag;
} ARFBookTagRelationships;

@class ARFBook;
@class ARFTag;

@interface ARFBookTagID : NSManagedObjectID {}
@end

@interface _ARFBookTag : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFBookTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFBookTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (ARFBook*)primitiveBook;
- (void)setPrimitiveBook:(ARFBook*)value;

- (ARFTag*)primitiveTag;
- (void)setPrimitiveTag:(ARFTag*)value;

@end
