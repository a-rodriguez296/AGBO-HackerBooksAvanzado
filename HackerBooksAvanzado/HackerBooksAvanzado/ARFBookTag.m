#import "ARFBookTag.h"
#import "ARFCoreDataUtils.h"

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

@end
