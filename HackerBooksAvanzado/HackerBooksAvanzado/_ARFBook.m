// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBook.m instead.

#import "_ARFBook.h"

const struct ARFBookAttributes ARFBookAttributes = {
	.creationDate = @"creationDate",
	.favorite = @"favorite",
	.modificationDate = @"modificationDate",
	.pdfURL = @"pdfURL",
	.photoURL = @"photoURL",
	.title = @"title",
};

const struct ARFBookRelationships ARFBookRelationships = {
	.annotations = @"annotations",
	.authors = @"authors",
	.bookTags = @"bookTags",
	.pdf = @"pdf",
	.photo = @"photo",
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

	if ([key isEqualToString:@"favoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"favorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic creationDate;

@dynamic favorite;

- (BOOL)favoriteValue {
	NSNumber *result = [self favorite];
	return [result boolValue];
}

- (void)setFavoriteValue:(BOOL)value_ {
	[self setFavorite:@(value_)];
}

- (BOOL)primitiveFavoriteValue {
	NSNumber *result = [self primitiveFavorite];
	return [result boolValue];
}

- (void)setPrimitiveFavoriteValue:(BOOL)value_ {
	[self setPrimitiveFavorite:@(value_)];
}

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

@dynamic bookTags;

- (NSMutableSet*)bookTagsSet {
	[self willAccessValueForKey:@"bookTags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"bookTags"];

	[self didAccessValueForKey:@"bookTags"];
	return result;
}

@dynamic pdf;

@dynamic photo;

@end

