// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFAuthor.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFAuthorAttributes {
	__unsafe_unretained NSString *name;
} ARFAuthorAttributes;

extern const struct ARFAuthorRelationships {
	__unsafe_unretained NSString *books;
} ARFAuthorRelationships;

@class ARFBook;

@interface ARFAuthorID : NSManagedObjectID {}
@end

@interface _ARFAuthor : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _ARFAuthor (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(ARFBook*)value_;
- (void)removeBooksObject:(ARFBook*)value_;

@end

@interface _ARFAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
