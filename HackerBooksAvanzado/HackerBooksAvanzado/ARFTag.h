#import "_ARFTag.h"

@interface ARFTag : _ARFTag {}


+(instancetype) createTagWithName:(NSString *) name;


+(ARFTag *) checkIfTagExistsWithName:(NSString *) name;

//+(NSData *) createDataWithTag:(ARFTag *) tag;
//+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI context:(NSManagedObjectContext *) context;


@end
