#import "ARFBook.h"
#import "ARFCoreDataUtils.h"
#import "ARFPhoto.h"
#import "ARFAuthor.h"
#import "ARFTag.h"
#import "ARFConstants.h"
#import "AGTCoreDataStack.h"

@interface ARFBook ()

// Private interface goes here.

@end

@implementation ARFBook

#pragma mark Delegate Initializer
+(instancetype) createBookWithTitle:(NSString *) title tags:(NSArray *) tagList authors:(NSArray *) authorsList aPhotoURL:(NSString *) photoURL aPDFURL:(NSString *) pdfURL{
    
    ARFBook *book = [NSEntityDescription insertNewObjectForEntityForName:[ARFBook entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [book setTitle:title];
    [book setFavoriteValue:NO];
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
    
    
    return book;
    
}

#pragma mark Class Methods

+(NSArray *)observableKeys{
    return @[ARFBookAttributes.favorite];
}



#pragma mark KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    

    //con el != nil nos asguramos que no se entra a este metodo cuando se estan creando los books
    if ([keyPath isEqualToString:ARFBookAttributes.favorite] && ![[change objectForKey:NSKeyValueChangeOldKey] isKindOfClass:[NSNull class]] && [change objectForKey:NSKeyValueChangeOldKey] != [change objectForKey:NSKeyValueChangeNewKey]) {
        
        //Busqueda si existe un tag con el nombre de favorito
        NSFetchRequest *tagRequest = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
        [tagRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,@"Favorite"]];
        ARFTag *favoriteTag = [[[ARFCoreDataUtils model] executeFetchRequest:tagRequest errorBlock:nil] firstObject];;
        if ([self favoriteValue]) {
            
            //Si no existe hay que crearlo
            if (!favoriteTag) {
                favoriteTag = [ARFTag createTagWithName:@"Favorite"];
            }
            
            //Se añade el libro al conjunto de libros que tiene el tag
            [favoriteTag addBooksObject:self];
        }
        else{
            [self removeTagsObject:favoriteTag];
        }
    }
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
@end
