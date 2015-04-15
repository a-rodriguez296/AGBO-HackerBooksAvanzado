// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFTag.m instead.

#import "_ARFTag.h"

const struct ARFTagAttributes ARFTagAttributes = {
	.tagName = @"tagName",
};

const struct ARFTagRelationships ARFTagRelationships = {
	.booksTags = @"booksTags",
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

@dynamic tagName;

@dynamic booksTags;

- (NSMutableSet*)booksTagsSet {
	[self willAccessValueForKey:@"booksTags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"booksTags"];

	[self didAccessValueForKey:@"booksTags"];
	return result;
}

@end

