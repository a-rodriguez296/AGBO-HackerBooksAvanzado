// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBookTags.m instead.

#import "_ARFBookTags.h"

const struct ARFBookTagsAttributes ARFBookTagsAttributes = {
	.sectionTitle = @"sectionTitle",
};

const struct ARFBookTagsRelationships ARFBookTagsRelationships = {
	.book = @"book",
	.tag = @"tag",
};

@implementation ARFBookTagsID
@end

@implementation _ARFBookTags

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookTags" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookTags";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookTags" inManagedObjectContext:moc_];
}

- (ARFBookTagsID*)objectID {
	return (ARFBookTagsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic sectionTitle;

@dynamic book;

@dynamic tag;

@end

