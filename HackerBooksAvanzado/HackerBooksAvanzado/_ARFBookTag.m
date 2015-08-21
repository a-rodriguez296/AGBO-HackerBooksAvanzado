// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFBookTag.m instead.

#import "_ARFBookTag.h"

const struct ARFBookTagAttributes ARFBookTagAttributes = {
	.name = @"name",
};

const struct ARFBookTagRelationships ARFBookTagRelationships = {
	.book = @"book",
	.tag = @"tag",
};

@implementation ARFBookTagID
@end

@implementation _ARFBookTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookTag" inManagedObjectContext:moc_];
}

- (ARFBookTagID*)objectID {
	return (ARFBookTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic book;

@dynamic tag;

@end

