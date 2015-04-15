// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBookTags.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFBookTagsAttributes {
	__unsafe_unretained NSString *sectionTitle;
} ARFBookTagsAttributes;

extern const struct ARFBookTagsRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *tag;
} ARFBookTagsRelationships;

@class ARFBook;
@class ARFTag;

@interface ARFBookTagsID : NSManagedObjectID {}
@end

@interface _ARFBookTags : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFBookTagsID* objectID;

@property (nonatomic, strong) NSString* sectionTitle;

//- (BOOL)validateSectionTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFBookTags (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveSectionTitle;
- (void)setPrimitiveSectionTitle:(NSString*)value;

- (ARFBook*)primitiveBook;
- (void)setPrimitiveBook:(ARFBook*)value;

- (ARFTag*)primitiveTag;
- (void)setPrimitiveTag:(ARFTag*)value;

@end
