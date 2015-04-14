//
//  ARFPredicates.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ARFTag;


@interface ARFPredicates : NSObject

//Predicado para obtener los libros asociados a un tag
+(NSPredicate *) booksPredicateWithTag:(ARFTag *) tag;

//Predicado para obtener los libros que han sido marcados como favoritos
+(NSPredicate *) favoriteBooksPredicate;

@end
