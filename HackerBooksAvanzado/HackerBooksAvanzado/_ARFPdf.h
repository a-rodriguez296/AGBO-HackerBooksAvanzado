// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFPdf.h instead.

#import <CoreData/CoreData.h>
#import "ARFKVOBaseClass.h"

extern const struct ARFPdfAttributes {
	__unsafe_unretained NSString *data;
} ARFPdfAttributes;

extern const struct ARFPdfRelationships {
	__unsafe_unretained NSString *book;
} ARFPdfRelationships;

@class ARFBook;

@interface ARFPdfID : NSManagedObjectID {}
@end

@interface _ARFPdf : ARFKVOBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ARFPdfID* objectID;

@property (nonatomic, strong) NSData* data;

//- (BOOL)validateData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ARFBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ARFPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveData;
- (void)setPrimitiveData:(NSData*)value;

- (ARFBook*)primitiveBook;
- (void)setPrimitiveBook:(ARFBook*)value;

@end
