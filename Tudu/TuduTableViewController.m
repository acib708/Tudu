//
//  TuduTableViewController.m
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import "TuduTableViewController.h"
#import "Tudu.h"
#import "AddViewController.h"

@interface TuduTableViewController ()
@property (nonatomic, strong) NSMutableArray *tudus;
@end

@implementation TuduTableViewController
@synthesize tudus = _tudus;

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    // Super call
    [super viewDidLoad];
    
    // Add Add button to the right of the navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(addTudu)];
    // Create gesture recognizer for deleting items
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(deleteTuduForGesture:)];
    [swipeGestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft)];
    [self.tableView addGestureRecognizer:swipeGestureRecognizer];
    
    // Init some Tudu items. Notice the three line methods!
    Tudu *item1 = [[Tudu alloc] initWithNombre:@"Comprar un perro"
                                          nota: @"Que NO sea Beagle"
                                    completado:NO];
    Tudu *item2 = [[Tudu alloc] initWithNombre:@"Presentar Core Data"
                                          nota: @"Github: https://github.com/acib708/Tudu.git"
                                    completado:NO];
    Tudu *item3 = [[Tudu alloc] initWithNombre:@"Leer A Universe From Nothing"
                                          nota: @"Lawrence Krausse"
                                    completado:YES];
    
    // Add items to a mutable array. This will be our source for the data in the table view
    _tudus = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, nil];
    
    // Add Title
    [self setTitle:@"Tudu"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Add/Delete Tudus
-(void)addTudu{
    [self performSegueWithIdentifier:@"modalToAdd" sender:self];
}

- (void)deleteTuduForGesture:(UILongPressGestureRecognizer *)gesture{
    // Check if gesture has finishes
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        // Get cell the gestured triggered off of
        UITableViewCell *cell = (UITableViewCell *)gesture.view;
        // Remove tudu object related to such cell
        [_tudus removeObjectAtIndex:[self.tableView indexPathForCell:cell].row];
        // Update table
        [self.tableView reloadData];
    }
}

#pragma mark - TableView Data Source and Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tudus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deque cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tuduCell" forIndexPath:indexPath];
    
    // Get tudu object from array, corresponding to the current cell
    Tudu *currentTudu = [_tudus objectAtIndex:indexPath.row];
    
    // Configure the cell
    [cell.textLabel       setText:currentTudu.nombre];
    [cell.detailTextLabel setText:currentTudu.nota];
    if(currentTudu.completado)
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Tudu *selectedTudu = [_tudus objectAtIndex:indexPath.row];
    
    if(selectedTudu.completado){
        [selectedTudu setCompletado:NO];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    }
    else{
        [selectedTudu setCompletado:YES];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

-(IBAction)done:(UIStoryboardSegue *)segue{
    AddViewController *avc = segue.sourceViewController;
    
    if(avc.tudu){
        [_tudus addObject:avc.tudu];
        [self.tableView reloadData];
    }
}

@end
