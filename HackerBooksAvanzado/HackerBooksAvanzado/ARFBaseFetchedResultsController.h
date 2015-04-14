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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

@end
