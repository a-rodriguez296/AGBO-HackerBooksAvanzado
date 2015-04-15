// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFTag.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFTagAttributes {
	__unsafe_unretained NSString *tagName;
} ARFTagAttributes;

extern const struct ARFTagRelationships {
	__unsafe_unretained NSString *booksTags;
} ARFTagRelationships;

@class ARFBookTags;

@interface ARFTagID : NSManagedObjectID {}
@end

@interface _ARFTag : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFTagID* objectID;

@property (nonatomic, strong) NSString* tagName;

//- (BOOL)validateTagName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *booksTags;

- (NSMutableSet*)booksTagsSet;

@end

@interface _ARFTag (BooksTagsCoreDataGeneratedAccessors)
- (void)addBooksTags:(NSSet*)value_;
- (void)removeBooksTags:(NSSet*)value_;
- (void)addBooksTagsObject:(ARFBookTags*)value_;
- (void)removeBooksTagsObject:(ARFBookTags*)value_;

@end

@interface _ARFTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTagName;
- (void)setPrimitiveTagName:(NSString*)value;

- (NSMutableSet*)primitiveBooksTags;
- (void)setPrimitiveBooksTags:(NSMutableSet*)value;

@end
