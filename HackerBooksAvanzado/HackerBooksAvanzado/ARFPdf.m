#import "ARFPdf.h"
#import "ARFBook.h"
#import "ARFCoreDataUtils.h"
#import "NSString+Category.h"

@interface ARFPdf ()

// Private interface goes here.

@end

@implementation ARFPdf

+(instancetype) createPDFWithBook:(ARFBook *) book withData:(NSData *) data{
    ARFPdf *pdf = [NSEntityDescription insertNewObjectForEntityForName:[ARFPdf entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    [pdf setBook:book];
    [pdf setData:data];
    return pdf;
}

- (NSString*)filePathString
{
    // Parse out the filename
    NSString *description = [self.data description];
    NSString *filename = [description returnBetweenString:@"path = " andString:@" ;"];
    // Determine the name of the store
    NSPersistentStoreCoordinator *psc = self.managedObjectContext.persistentStoreCoordinator;
    NSPersistentStore *ps = [psc.persistentStores objectAtIndex:0];
    NSURL *storeURL = [psc URLForPersistentStore:ps];
    NSString *storeNameWithExt = [storeURL lastPathComponent];
    NSString *storeName = [storeNameWithExt stringByDeletingPathExtension];
    // Generate path to the 'external data' directory
    NSString *documentsPath = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                       inDomains:NSUserDomainMask] lastObject] path];
    NSString *pathComponentToExternalStorage = [NSString stringWithFormat:@".%@_SUPPORT/_EXTERNAL_DATA",storeName];
    NSString *pathToExternalStorage = [documentsPath stringByAppendingPathComponent:pathComponentToExternalStorage];
    // Generate path to the media file
    NSString *pathToMedia = [pathToExternalStorage stringByAppendingPathComponent:filename];
    return pathToMedia;
}

@end
