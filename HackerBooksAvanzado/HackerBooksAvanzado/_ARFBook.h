// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBook.h instead.

@import CoreData;
#import "ARFKVOBaseClass.h"

extern const struct ARFBookAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *favorite;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *photoURL;
	__unsafe_unretained NSString *title;
} ARFBookAttributes;

extern const struct ARFBookRelationships {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *bookTags;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *photo;
} ARFBookRelationships;

@class ARFAuthor;
@class ARFBookTags;
@class ARFPdf;
@class ARFPhoto;

@interface ARFBookID : NSManagedObjectID {}
@end

@interface _ARFBook : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFBookID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* favorite;

@property (atomic) BOOL favoriteValue;
- (BOOL)favoriteValue;
- (void)setFavoriteValue:(BOOL)value_;

//- (BOOL)validateFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* photoURL;

//- (BOOL)validatePhotoURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@property (nonatomic, strong) NSSet *bookTags;

- (NSMutableSet*)bookTagsSet;

@property (nonatomic, strong) ARFPdf *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFBook (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(ARFAuthor*)value_;
- (void)removeAuthorsObject:(ARFAuthor*)value_;

@end

@interface _ARFBook (BookTagsCoreDataGeneratedAccessors)
- (void)addBookTags:(NSSet*)value_;
- (void)removeBookTags:(NSSet*)value_;
- (void)addBookTagsObject:(ARFBookTags*)value_;
- (void)removeBookTagsObject:(ARFBookTags*)value_;

@end

@interface _ARFBook (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSNumber*)primitiveFavorite;
- (void)setPrimitiveFavorite:(NSNumber*)value;

- (BOOL)primitiveFavoriteValue;
- (void)setPrimitiveFavoriteValue:(BOOL)value_;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitivePhotoURL;
- (void)setPrimitivePhotoURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

- (NSMutableSet*)primitiveBookTags;
- (void)setPrimitiveBookTags:(NSMutableSet*)value;

- (ARFPdf*)primitivePdf;
- (void)setPrimitivePdf:(ARFPdf*)value;

- (ARFPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(ARFPhoto*)value;

@end
