//
//  ARFBookViewController.m
//  Hacker Books
//
//  Created by Alejandro Rodriguez on 3/25/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBookViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ARFBook.h"
#import "ARFPhoto.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CoreData+MagicalRecord.h"
#import "ARFPdf.h"
#import "ARFBookApiClient.h"
//#import "ReaderDocument.h"
//#import "ReaderViewController.h"

@class ARFLibrary;
@class ARFBook;
@class ARFLIbraryViewController;

@interface ARFBookViewController () //<ReaderViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgBook;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthors;
@property (weak, nonatomic) IBOutlet UILabel *lblTaglist;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorite;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;


@property (nonatomic, strong) ARFBook *book;

@end

@implementation ARFBookViewController

-(id) initWithBook:(ARFBook *)book{
    if (self = [super init]) {
        _book= book;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectBookInTable:) name:kDidSelectBookInTableNotification object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitle:self.book.title];
    [self setupView];
    
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void) setupView{
    [self.lblTitle setText:self.book.title];
    [self.lblAuthors setText:[ARFBook authorsWithBook:self.book]];
    [self.lblTaglist setText:[ARFBook tagsWithBook:self.book]];
    [self.btnFavorite setSelected:self.book.favoriteValue];
    
    
    //Imagen
    ARFPhoto * bookImage = self.book.photo;
    if (bookImage.image) {
        
        //Hay imagen guardada
        [self.imgBook setImage:bookImage.image];
        
    }
    else{
        //Hay que descargarla
    
        [self.imgBook sd_setImageWithURL:[NSURL URLWithString:self.book.photoURL] placeholderImage:[UIImage imageNamed:@"not_available.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [bookImage setImage:image];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchFavorite:(id)sender {
    
    [self.book setFavoriteValue:!self.book.favoriteValue];
    [sender setSelected:self.book.favoriteValue];

}

- (IBAction)viewPDF:(id)sender {
    
    //PDF
    ARFPdf * pdf = self.book.pdf;
    if (pdf.data) {
        
        //Hay PDF guardado
        
        
    }
    else{
        //Hay que descargarlo
        [self.progressView setHidden:NO];
        [self.view setUserInteractionEnabled:NO];
        
        [ARFBookApiClient donwloadDataWithURL:self.book.pdfURL withSuccess:^(NSData *data) {
            
            [self.view setUserInteractionEnabled:YES];
            
            [self restartProgressBar];
            ARFPdf *b = [ARFPdf createPDFWithBook:self.book withData:data];
            
            
            
            //Averiguar si existe el archivo
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *fullCachePath = ((NSURL*)[[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject] ).path;
            NSString *bookLocalRelativeURL = [[self.book.pdfURL componentsSeparatedByString:@"/"] lastObject];
            NSString *fullPath = [fullCachePath stringByAppendingPathComponent:bookLocalRelativeURL];
            
            if ([data writeToFile:fullPath atomically:YES]) {
                
            }
            
        } withFailure:^(NSString *error) {
            [self.view setUserInteractionEnabled:YES];
            
            [self restartProgressBar];
            
        }withProgress:^(float progress) {
            [self.progressView setProgress:progress];
        }];
    }
    
}


-(void) restartProgressBar{
    [self.progressView setHidden:YES];
    [self.progressView setProgress:0.0f];
}

#pragma mark ARFLIbraryViewControllerDelegate
-(void)libraryViewController:(ARFLIbraryViewController *)libraryVC didSelectBook:(ARFBook *)book{
   
//    self.book = book;
//    [self setupView];
//    
//    for (id vc in self.navigationController.viewControllers) {
//        if ([vc isKindOfClass:[ReaderViewController class]]) {
//            //Estoy en pdf
//            
//            //Hacer pop del readerVC actual
//            [self dismissReaderViewController:vc];
//            
//            [self viewPDF:nil];
//        }
//    }
}


#pragma mark ARFLibraryViewControllerDelegate
//-(void)dismissReaderViewController:(ReaderViewController *)viewController{
//    [self.navigationController.navigationBar setHidden:NO];
//    [self.navigationController popViewControllerAnimated:YES];
//}

@end
