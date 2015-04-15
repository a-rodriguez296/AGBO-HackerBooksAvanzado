//
//  ARFPredicates.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFPredicates.h"
#import "ARFTag.h"
#import "ARFBook.h"

@implementation ARFPredicates

+(NSPredicate *) booksPredicateWithTag:(ARFTag *) tag{
    return  nil;//[NSPredicate predicateWithFormat:@"ANY %K == %@ && %K == NO",ARFBookRelationships.tags,tag,ARFBookAttributes.favorite];
}

+(NSPredicate *) favoriteBooksPredicate{
    return [NSPredicate predicateWithFormat:@"%K == %i",ARFBookAttributes.favorite,YES];
}


@end
