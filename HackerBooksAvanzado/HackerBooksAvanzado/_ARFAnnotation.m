// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ARFAnnotation.m instead.

#import "_ARFAnnotation.h"

const struct ARFAnnotationAttributes ARFAnnotationAttributes = {
	.text = @"text",
};

const struct ARFAnnotationRelationships ARFAnnotationRelationships = {
	.image = @"image",
	.location = @"location",
};

@implementation ARFAnnotationID
@end

@implementation _ARFAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (ARFAnnotationID*)objectID {
	return (ARFAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic image;

@dynamic location;

@end

