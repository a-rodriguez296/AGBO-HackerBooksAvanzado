// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFTag.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFTagAttributes {
	__unsafe_unretained NSString *tagName;
} ARFTagAttributes;

extern const struct ARFTagRelationships {
	__unsafe_unretained NSString *books;
} ARFTagRelationships;

@class ARFBook;

@interface ARFTagID : NSManagedObjectID {}
@end

@interface _ARFTag : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFTagID* objectID;

@property (nonatomic, strong) NSString* tagName;

//- (BOOL)validateTagName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _ARFTag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(ARFBook*)value_;
- (void)removeBooksObject:(ARFBook*)value_;

@end

@interface _ARFTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTagName;
- (void)setPrimitiveTagName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
