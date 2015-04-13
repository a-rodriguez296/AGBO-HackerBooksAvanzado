//
//  ARFBookParser.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARFBookParser : NSObject


@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSArray * authorsList;
@property (nonatomic, strong) NSArray *tagsList;
@property (nonatomic, strong) NSString *urlImage;
@property (nonatomic, strong) NSString *urlPDF;
@property (nonatomic, assign) BOOL isFavorite;


-(void) parseBookWithData:(NSDictionary *) bookDictionary;

@end
