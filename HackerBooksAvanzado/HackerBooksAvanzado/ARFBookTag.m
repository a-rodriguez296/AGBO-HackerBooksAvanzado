#import "ARFBookTag.h"
#import "ARFCoreDataUtils.h"
#import "ARFConstants.h"

@interface ARFBookTag ()

// Private interface goes here.

@end

@implementation ARFBookTag

+(instancetype) createBookTagWithBook:(ARFBook *) book tag:(ARFTag *) tag{
    
    ARFBookTag *bookTag = [ARFBookTag uniqueObjectWithValue:[NSString stringWithFormat:@"%@+%@", book.title, tag.tagName] forKey:ARFBookTagAttributes.name inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    
    bookTag.book = book;
    bookTag.tag = tag;
    
    return bookTag;
}

+(NSFetchedResultsController *) createFRCForTable{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFBookTag entityName]];
    [req setSortDescriptors:@[
                              [NSSortDescriptor sortDescriptorWithKey:@"tag.tagName" ascending:YES selector:@selector(compare:)],
                              [NSSortDescriptor sortDescriptorWithKey:@"book.title" ascending:YES selector:@selector(compare:)]]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[ARFCoreDataUtils defaultContext] sectionNameKeyPath:@"tag.tagName" cacheName:nil];
}

+(ARFBookTag *) retrieveLastSelectedBookTag{
    NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
    return (ARFBookTag *)[ARFCoreDataUtils objectWithArchivedURIRepresentation:lastObjectData context:[ARFCoreDataUtils defaultContext]];
}

@end
