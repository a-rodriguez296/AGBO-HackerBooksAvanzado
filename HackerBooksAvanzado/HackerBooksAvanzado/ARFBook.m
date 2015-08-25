#import "ARFBook.h"
#import "ARFCoreDataUtils.h"
#import "ARFPhoto.h"
#import "ARFAuthor.h"
#import "ARFTag.h"
#import "ARFConstants.h"
#import "AGTCoreDataStack.h"
#import "ARFBookTag.h"

@interface ARFBook ()

// Private interface goes here.

@end

@implementation ARFBook

#pragma mark Delegate Initializer
+(instancetype) createBookWithTitle:(NSString *) title tags:(NSArray *) tagList authors:(NSArray *) authorsList aPhotoURL:(NSString *) photoURL aPDFURL:(NSString *) pdfURL{
    
    ARFBook *book = [ARFBook uniqueObjectWithValue:title forKey:ARFBookAttributes.title inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [book setTitle:title];
    [book setCreationDate:[NSDate date]];
    [book setModificationDate:[NSDate date]];
    [book setPhotoURL:photoURL];
    [book setPdfURL:pdfURL];
    
    
    
    //Relación obligatoria a ARFPhoto
    book.photo =[NSEntityDescription insertNewObjectForEntityForName:[ARFPhoto entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    
    
    //Autores
    [ARFBook addAuthorsWithBook:book withAuthors:authorsList];
    
    
    //Tags
    [ARFBook addTagsWithTagList:tagList withBook:book];
    
    for (ARFTag *tag in book.tags) {
        
        [ARFBookTag createBookTagWithBook:book tag:tag];
    }
    
    
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

+(void) addTagsWithTagList:(NSArray *) tagList withBook:(ARFBook *) book{
    
    //Recorrer la lista de tags
    for (NSString *tagName in tagList) {
        
        //Verificar si el tag existe
        ARFTag *tagEntity = [ARFTag checkIfTagExistsWithName:tagName];
        
        //Verificar si ya existe un elemento con ese nombre
        //Si existe, agregarlo al set. De lo contrario crear una entidad y agregarla al set.
        if (!tagEntity) {
            tagEntity =[ARFTag createTagWithName:tagName];
        }
        
        [book addTagsObject:tagEntity];
    }
}

-(NSString *) normalizedTags{
    
    return [[[self.tags allObjects] sortedArrayUsingSelector:@selector(compare:)] componentsJoinedByString:@", "];
}

-(NSString *) normalizedAuthors{
    return [[[self.authors allObjects] sortedArrayUsingSelector:@selector(compare:)] componentsJoinedByString:@", "];
}


-(void) setIsFavorite:(BOOL)newValue{
    
    if (newValue != self.isFavorite) {
        
        ARFTag *favTag = [ARFTag favoriteTag];
        
        if (newValue) {
            
            //Creo el nuevo book tag asociado al tag favorito que acabo de crear
            [ARFBookTag createBookTagWithBook:self tag:favTag];
            
        }
        else{
            ARFBookTag *favoriteBookTag = [ARFBookTag createBookTagWithBook:self tag:favTag];
            
            [[ARFCoreDataUtils defaultContext] deleteObject:favoriteBookTag];
            
        }
        
        [[ARFCoreDataUtils defaultContext] processPendingChanges];
        [[NSNotificationCenter defaultCenter] postNotificationName:kBookDidChangeNotification object:self];

    }
}

-(BOOL) isFavorite{
    
    //Traer los tags asociados a este libro en un NSSet.
    NSSet *values = [self.bookTag valueForKey:ARFBookTagRelationships.tag];
    
    //Convertir el NSSet de objetos ARFTAG a Bool
    values = [values valueForKey:@"isFavorite"];
    
    return [values member:@YES] != nil;
    
}
@end
