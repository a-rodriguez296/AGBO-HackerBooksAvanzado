//
//  ARFBookViewController.m
//  Hacker Books
//
//  Created by Alejandro Rodriguez on 3/25/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "ARFBookViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ARFBook.h"
#import "ARFPhoto.h"
#import "ARFBookApiClient.h"
#import "ARFCreateAnnotationViewController.h"
#import "ARFConstants.h"
#import "ARFCoreDataUtils.h"
#import "ARFPdfViewController.h"
#import "ARFAnnotation.h"
#import "ARFAnnotationsViewController.h"

@interface ARFBookViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgBook;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthors;
@property (weak, nonatomic) IBOutlet UILabel *lblTaglist;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorite;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeBookState:) name:kBookDidChangeNotification object:nil];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
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
    [self.lblAuthors setText:[self.book normalizedAuthors]];
    [self.lblTaglist setText:[self.book normalizedTags]];
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

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark IBActions
- (IBAction)addAnnotation:(id)sender {
    
    ARFCreateAnnotationViewController *createAnnotationVC = [[ARFCreateAnnotationViewController alloc] initWithBook:self.book];
    [self.navigationController pushViewController:createAnnotationVC animated:YES];
}

- (IBAction)onTouchFavorite:(id)sender {
    
    [self.book setFavoriteValue:!self.book.favoriteValue];
}
- (IBAction)viewAnnotations:(id)sender {
    
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[ARFAnnotation entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFAnnotationRelationships.book,self.book]];
    [req setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:ARFAnnotationAttributes.modificationDate ascending:YES]]];
    NSFetchedResultsController *frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[ARFCoreDataUtils defaultContext] sectionNameKeyPath:nil cacheName:nil];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(148, 171)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumInteritemSpacing:10];
    [layout setMinimumLineSpacing:10];
    [layout setSectionInset:UIEdgeInsetsMake(0, 8, 0, 8)];
    
    ARFAnnotationsViewController *annotationsVC = [[ARFAnnotationsViewController alloc] initWithFetchedResultsController:frc layout:layout];
    [self.navigationController pushViewController:annotationsVC animated:YES];
}

#pragma mark  kBookDidChangeNotification
-(void) didChangeBookState:(NSNotification *) notification{
    
    ARFBook *book = notification.object;
    NSString * changedAttribute = [notification.userInfo objectForKey:kChangedAttribute];
    if ([changedAttribute isEqualToString:ARFBookAttributes.favorite]) {
        [self.btnFavorite setSelected:book.favoriteValue];
    }
}

- (IBAction)viewPDF:(id)sender {
    
    ARFPdfViewController *pdfVC= [[ARFPdfViewController alloc] initWithBook:self.book];
    [self.navigationController pushViewController:pdfVC animated:YES];
}


#pragma mark ARFBooksViewControllerDelegate
-(void)booksViewController:(ARFBooksViewController *)libraryVC didSelectBook:(ARFBook *)book{
    self.book = book;
    [self setupView];
}

@end
