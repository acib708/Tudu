//
//  TuduTableViewController.m
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import "TuduTableViewController.h"
#import "Tudu.h"

@interface TuduTableViewController ()

@property (nonatomic, strong) NSMutableArray *tudus;

@end

@implementation TuduTableViewController
@synthesize tudus = _tudus;

- (void)viewDidLoad {
    // Call to super
    [super viewDidLoad];
    
    // Add Add button to the right of the navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(addTudu)];
    
    // Init tudus array with seed data
    Tudu *item1 = [[Tudu alloc] initWithNombre:@"Comprar un perro"             andCompletado:NO];
    Tudu *item2 = [[Tudu alloc] initWithNombre:@"Presentar Core Data"          andCompletado:NO];
    Tudu *item3 = [[Tudu alloc] initWithNombre:@"Leer A Universe From Nothing" andCompletado:NO];
    
    _tudus = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, nil];
    
    // Add Title
    [self setTitle:@"Tudu"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Add Button Pressed
-(void)addTudu{
    NSLog(@"Add Tudu");
}

#pragma mark - TableView Data Source and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tudus.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
