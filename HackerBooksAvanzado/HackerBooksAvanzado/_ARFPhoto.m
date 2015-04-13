// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFPhoto.m instead.

#import "_ARFPhoto.h"

const struct ARFPhotoAttributes ARFPhotoAttributes = {
	.photoData = @"photoData",
};

const struct ARFPhotoRelationships ARFPhotoRelationships = {
	.anotations = @"anotations",
	.book = @"book",
};

@implementation ARFPhotoID
@end

@implementation _ARFPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (ARFPhotoID*)objectID {
	return (ARFPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic anotations;

- (NSMutableSet*)anotationsSet {
	[self willAccessValueForKey:@"anotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"anotations"];

	[self didAccessValueForKey:@"anotations"];
	return result;
}

@dynamic book;

@end

