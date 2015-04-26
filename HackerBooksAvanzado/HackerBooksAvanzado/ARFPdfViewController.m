//
//  ARFPdfViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/26/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFPdfViewController.h"
#import "ARFBook.h"
#import "ARFPdf.h"
#import "NSString+Category.h"
#import "ARFBookApiClient.h"
#import "ARFConstants.h"

@interface ARFPdfViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *pdfView;

@property (weak, nonatomic) IBOutlet UILabel *lblLoading;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) ARFBook * model;


@end

@implementation ARFPdfViewController



-(id) initWithBook:(ARFBook *) book{
    
    if (self = [super init]) {
        _model = book;
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self syncWithModel];
}

-(void) initPDFView{
    
    [self.pdfView loadData:self.model.pdf.data MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:nil];
    
}


-(void) showDownloadViewsWithFlag:(BOOL) flag{
    [self.lblLoading setHidden:flag];
    [self.progressView setHidden:flag];
    [self.pdfView setHidden:!flag];
    if (flag) {
        [self.progressView setProgress:0.0];
    }
}

-(void) syncWithModel{
    
    self.title = self.model.title;
    

    if (self.model.pdf) {
        
        //Hay libro guardado
        [self initPDFView];
    }
    else{
        
        //Hay que descargarlo
        
        //Mostrar views de descarga
        [self showDownloadViewsWithFlag:NO];
        
        
        _ME_WEAK
        [ARFBookApiClient donwloadDataWithURL:self.model.pdfURL withSuccess:^(NSData *data) {
            
            
            //Esconder views de descarga
            [me showDownloadViewsWithFlag:YES];
            
            //Guardar la data recibida
            [ARFPdf createPDFWithBook:me.model withData:data];
            [me initPDFView];
            
        } withFailure:^(NSString *error) {
            //Esconder views de descarga
            [me showDownloadViewsWithFlag:YES];
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"The application was unable to donwload the book's PDF. Try again later" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [me.navigationController popViewControllerAnimated:YES];
            }];
            
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        } withProgress:^(float progress) {
            [me.progressView setProgress:progress];
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectBook:) name:kDidSelectBookNotification object:nil];
    
     [self setEdgesForExtendedLayout:UIRectEdgeNone];
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark kDidSelectBookNotification
-(void) didSelectBook:(NSNotification *) notification{
    self.model = notification.object;
    [self syncWithModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
