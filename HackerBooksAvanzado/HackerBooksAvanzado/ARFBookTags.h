#import "_ARFBookTags.h"
@class ARFBook;
@class ARFTag;

@interface ARFBookTags : _ARFBookTags {}
// Custom logic goes here.
+(instancetype) createBookTagsWithBook:(ARFBook *) book withTag:(ARFTag *) tag;
+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI context:(NSManagedObjectContext *) context;

+(NSData *) createDataWithBookTag:(ARFBookTags *) bookTags;
+(NSFetchedResultsController *) createFRCForTable;

@end
