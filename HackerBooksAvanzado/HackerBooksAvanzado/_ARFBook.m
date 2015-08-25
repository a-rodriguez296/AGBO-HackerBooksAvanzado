// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBook.m instead.

#import "_ARFBook.h"

const struct ARFBookAttributes ARFBookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.pdfURL = @"pdfURL",
	.photoURL = @"photoURL",
	.title = @"title",
};

const struct ARFBookRelationships ARFBookRelationships = {
	.annotations = @"annotations",
	.authors = @"authors",
	.bookTag = @"bookTag",
	.pdf = @"pdf",
	.photo = @"photo",
	.tags = @"tags",
};

@implementation ARFBookID
@end

@implementation _ARFBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (ARFBookID*)objectID {
	return (ARFBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic pdfURL;

@dynamic photoURL;

@dynamic title;

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@dynamic authors;

- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];

	[self didAccessValueForKey:@"authors"];
	return result;
}

@dynamic bookTag;

- (NSMutableSet*)bookTagSet {
	[self willAccessValueForKey:@"bookTag"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"bookTag"];

	[self didAccessValueForKey:@"bookTag"];
	return result;
}

@dynamic pdf;

@dynamic photo;

@dynamic tags;

- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];

	[self didAccessValueForKey:@"tags"];
	return result;
}

@end

