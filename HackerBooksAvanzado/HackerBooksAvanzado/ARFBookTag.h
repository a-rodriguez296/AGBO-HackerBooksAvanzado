#import "_ARFBookTag.h"
#import "ARFBook.h"
#import "ARFTag.h"

@interface ARFBookTag : _ARFBookTag {}

+(instancetype) createBookTagWithBook:(ARFBook *) book tag:(ARFTag *) tag;

+(NSFetchedResultsController *) createFRCForTable;

+(ARFBookTag *) retrieveLastSelectedBookTag;

@end
