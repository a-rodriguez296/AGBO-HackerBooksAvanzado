#import "ARFBook.h"
#import "CoreData+MagicalRecord.h"
#import "ARFPhoto.h"
#import "ARFAuthor.h"
#import "ARFTag.h"

@interface ARFBook ()

// Private interface goes here.

@end

@implementation ARFBook

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
    
    NSMutableSet *tagsSet = [NSMutableSet setWithCapacity:tagList.count];
    //Recorrer la lista de tags
    for (NSString *tagName in tagList) {
        
        //Verificar si el tag existe
        ARFTag *tagEntity = [ARFTag checkIfTagExistsWithName:tagName];
        
        //Verificar si ya existe un elemento con ese nombre
        //Si existe, agregarlo al set. De lo contrario crear una entidad y agregarla al set.
        if (!tagEntity) {
            [tagsSet addObject:[ARFTag createTagWithName:tagName]];
        }
        else{
            [tagsSet addObject:tagEntity];
        }
    }
    
    //Agregar los tags
    [book addTags:tagsSet];
}

@end
