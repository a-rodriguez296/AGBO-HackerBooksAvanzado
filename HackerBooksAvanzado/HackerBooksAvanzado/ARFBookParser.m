//
//  ARFBookParser.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBookParser.h"

@implementation ARFBookParser


-(void) parseBookWithData:(NSDictionary *) bookDictionary{
    
    [self setTitle:[bookDictionary objectForKey:@"title"]];
    [self setAuthorsList:[[bookDictionary objectForKey:@"authors"] componentsSeparatedByString:@","]];
    [self setTagsList:[self trimLeadingSpacesWithArray:[[bookDictionary objectForKey:@"tags"] componentsSeparatedByString:@","]]];
    [self setUrlImage:[bookDictionary objectForKey:@"image_url"]];
    
    [self setUrlPDF:[bookDictionary objectForKey:@"pdf_url"]];
    [self setIsFavorite:NO];
}

-(NSArray *) trimLeadingSpacesWithArray:(NSArray *) array{
    NSMutableArray *responseArray = [NSMutableArray new];
    for (NSString *st in array) {
        NSString *trimmedString = [st stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [responseArray addObject:trimmedString];
    }
    return [NSArray arrayWithArray:responseArray];
}

@end
