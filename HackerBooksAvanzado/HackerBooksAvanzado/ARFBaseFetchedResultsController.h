//Adaptación clase Fernando Rodríguez

@import UIKit;
@import CoreData;

@interface ARFBaseFetchedResultsController : UIViewController <NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) BOOL suspendAutomaticTrackingOfChangesInManagedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property BOOL debug;


-(id) initWithFetchedResultsController: (NSFetchedResultsController *) aFetchedResultsController;

- (void)performFetch;

@end
