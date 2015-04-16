#import "ARFBook.h"
#import "CoreData+MagicalRecord.h"
#import "ARFPhoto.h"
#import "ARFAuthor.h"
#import "ARFTag.h"
#import "ARFBookTags.h"
#import "ARFConstants.h"

@interface ARFBook ()

// Private interface goes here.

@end

@implementation ARFBook

#pragma mark Delegate Initializer
+(instancetype) createBookWithTitle:(NSString *) title tags:(NSArray *) tagList authors:(NSArray *) authorsList aPhotoURL:(NSString *) photoURL aPDFURL:(NSString *) pdfURL{
    
    ARFBook *book = [ARFBook MR_createEntity];
    [book setTitle:title];
    [book setFavoriteValue:NO];
    [book setCreationDate:[NSDate date]];
    [book setModificationDate:[NSDate date]];
    [book setPhotoURL:photoURL];
    [book setPdfURL:pdfURL];
    

    
    
    //Relación obligatoria a ARFPhoto
    book.photo =[ARFPhoto MR_createEntity];
    
    
    //Autores
    [ARFBook addAuthorsWithBook:book withAuthors:authorsList];
    
    
    //Tags
    [ARFBook addTagsWithBook:book withTagList:tagList];
    
    
    return book;
    
}


#pragma mark Utils
+(void) addAuthorsWithBook:(ARFBook *) book withAuthors:(NSArray *) authorsList{
    
    //Autores
    
    NSMutableSet *authorsSet = [NSMutableSet setWithCapacity:authorsList.count];
    //Recorrer la lista de autores
    for (NSString *authorName in authorsList) {
        
        ARFAuthor *authorEntity = [ARFAuthor checkIfAuthorExistsWithName:authorName];
        
        //Verificar si ya existe un elemento con ese nombre
        //Si existe, agregarlo al set. De lo contrario crear una entidad y agregarla al set.
        if (!authorEntity) {
            [authorsSet addObject:[ARFAuthor createAuthorWithName:authorName]];
        }
        else{
            [authorsSet addObject:authorEntity];
        }
    }
    
    //Agegar los autores
    [book addAuthors:authorsSet];
}

+(void) addTagsWithBook:(ARFBook *) book withTagList:(NSArray *) tagList{
    
//    NSMutableSet *tagsSet = [NSMutableSet setWithCapacity:tagList.count];
    //Recorrer la lista de tags
    for (NSString *tagName in tagList) {
        
        //Verificar si el tag existe
        ARFTag *tagEntity = [ARFTag checkIfTagExistsWithName:tagName];
        
        //Verificar si ya existe un elemento con ese nombre
        //Si existe, agregarlo al set. De lo contrario crear una entidad y agregarla al set.
        if (!tagEntity) {
            tagEntity =[ARFTag createTagWithName:tagName];
        }
        
        [ARFBookTags createBookTagsWithBook:book withTag:tagEntity];
    }
}



#pragma mark Class Methods

+(NSString *) authorsWithBook:(ARFBook *) book{
    return [book.authors.allObjects componentsJoinedByString:@","];
}

+(NSString *) tagsWithBook:(ARFBook *) book{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFBookTagsRelationships.book,book];
    NSArray *tags = [ARFBookTags MR_findAllSortedBy:[NSString stringWithFormat:@"%@.%@",ARFBookTagsRelationships.tag,ARFTagAttributes.tagName] ascending:YES withPredicate:predicate];
    return [tags componentsJoinedByString:@","];
}


@end
