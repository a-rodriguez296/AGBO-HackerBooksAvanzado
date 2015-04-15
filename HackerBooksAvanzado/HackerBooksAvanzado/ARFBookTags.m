#import "ARFBookTags.h"
#import "ARFBook.h"
#import "ARFTag.h"
#import "CoreData+MagicalRecord.h"

@interface ARFBookTags ()

// Private interface goes here.

@end

@implementation ARFBookTags

+(instancetype) createBookTagsWithBook:(ARFBook *) book withTag:(ARFTag *) tag{
    ARFBookTags *bookTag = [ARFBookTags MR_createEntity];
    
    [bookTag setBook:book];
    [bookTag setTag:tag];
    
    return bookTag;
}


-(NSString *)sectionTitle{
    NSString * temp = [self primitiveSectionTitle];
    if (!temp) {
        if (self.book.favoriteValue)
            return @"Favoritos";
        else{
            return self.tag.tagName;
        }
    }
    else
        return temp;
}

@end
