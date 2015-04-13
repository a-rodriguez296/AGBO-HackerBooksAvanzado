// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFPdf.m instead.

#import "_ARFPdf.h"

const struct ARFPdfAttributes ARFPdfAttributes = {
	.data = @"data",
};

const struct ARFPdfRelationships ARFPdfRelationships = {
	.book = @"book",
};

@implementation ARFPdfID
@end

@implementation _ARFPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (ARFPdfID*)objectID {
	return (ARFPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic data;

@dynamic book;

@end

