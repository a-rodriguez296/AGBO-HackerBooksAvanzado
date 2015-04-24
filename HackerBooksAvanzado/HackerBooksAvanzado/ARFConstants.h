//
//  ARFConstants.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#ifndef HackerBooksAvanzado_ARFConstants_h
#define HackerBooksAvanzado_ARFConstants_h

//Macros
#define _ME_WEAK __weak typeof(self) me = self;


//Constante URL Libros
static NSString* const kBooksUrl                      = @"https://keepcodigtest.blob.core.windows.net/containerblobstest/books_readable.json";

//Constante ObjectID para guardar en NSUserDefaults
static NSString* const kObjectID                      = @"objectID";
static NSString* const kObjectRow                     = @"objectRow";

//Constante autoSave
static const NSUInteger kAutoSave = 5;

//Constantes BooksVC
static const NSUInteger kFirstSection = 0;
static const NSUInteger kFirstRow = 0;

//Notificaciones
static NSString* const kBookDidChangeNotification   = @"bookDidChangeNotification";
static NSString* const kChangedAttribute            = @"changedAttribute";

#endif
