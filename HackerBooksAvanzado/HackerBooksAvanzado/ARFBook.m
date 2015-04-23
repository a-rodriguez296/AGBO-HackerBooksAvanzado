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
    [ARFBook addTagsWithTagList:tagList withBook:book];
    
    
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
        
        [book addTagsObject:tagEntity];
    }
}



#pragma mark Class Methods

+(NSString *) authorsWithBook:(ARFBook *) book{
    return [book.authors.allObjects componentsJoinedByString:@","];
}

+(NSString *) tagsWithBook:(ARFBook *) book{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",ARFBookTagsRelationships.book,book];
    NSArray *tags = [ARFBookTags MR_findAllSortedBy:[NSString stringWithFormat:@"%@.%@",ARFBookTagsRelationships.tag,ARFTagAttributes.tagName] ascending:YES withPredicate:predicate];
    return [tags componentsJoinedByString:@", "];
}

+(NSArray *)observableKeys{
    return @[ARFBookAttributes.favorite];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    

    //con el != nil nos asguramos que no se entra a este metodo cuando se estan creando los books
    if ([keyPath isEqualToString:ARFBookAttributes.favorite] && ![[change objectForKey:NSKeyValueChangeOldKey] isKindOfClass:[NSNull class]] && [change objectForKey:NSKeyValueChangeOldKey] != [change objectForKey:NSKeyValueChangeNewKey]) {
        
        
        ARFTag *favoriteTag =  [[ARFTag MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFTagAttributes.tagName,@"Favorite"]] firstObject];
        if ([self favoriteValue]) {
            
            if (!favoriteTag) {
                favoriteTag = [ARFTag createTagWithName:@"Favorite"];
                
                ARFBook *androidBook = [[ARFBook MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFBookAttributes.title,@"Android Programming Tutorials"]] firstObject];
                [androidBook addTagsObject:favoriteTag];
                [self addTagsObject:favoriteTag];
            }
            else{
                [favoriteTag addBooksObject:self];
            }
            
            for (ARFTag *tag in [[ARFTag MR_findAll] sortedArrayUsingSelector:@selector(compare:)]) {
                NSLog(@"%@",tag);
                for (ARFBook *book in tag.books.allObjects) {
                    NSLog(@"%@",book.title);
                }
                NSLog(@"///////////////////////////////////////////////");
            }
            
        }
        else{
            [self removeTagsObject:favoriteTag];
        }
        
        
        
        
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateStyle:NSDateFormatterLongStyle];
//        [formatter setTimeStyle:NSDateFormatterLongStyle];
//        NSString *name = [NSString stringWithFormat:@"%@",@"A"];// @"A", [formatter stringFromDate:[NSDate date]]];
//        ARFTag *a = [ARFTag createTagWithName:name];
//        [a addBooksObject:self];
        
    }

}


@end
