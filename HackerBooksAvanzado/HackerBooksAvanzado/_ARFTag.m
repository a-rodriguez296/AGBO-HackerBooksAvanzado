// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFTag.m instead.

#import "_ARFTag.h"

const struct ARFTagAttributes ARFTagAttributes = {
	.proxyForSorting = @"proxyForSorting",
	.tagName = @"tagName",
};

const struct ARFTagRelationships ARFTagRelationships = {
	.bookTag = @"bookTag",
	.books = @"books",
};

@implementation ARFTagID
@end

@implementation _ARFTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (ARFTagID*)objectID {
	return (ARFTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic proxyForSorting;

@dynamic tagName;

@dynamic bookTag;

- (NSMutableSet*)bookTagSet {
	[self willAccessValueForKey:@"bookTag"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"bookTag"];

	[self didAccessValueForKey:@"bookTag"];
	return result;
}

@dynamic books;

- (NSMutableSet*)booksSet {
	[self willAccessValueForKey:@"books"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"books"];

	[self didAccessValueForKey:@"books"];
	return result;
}

@end

