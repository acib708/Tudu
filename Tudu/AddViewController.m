//
//  AddViewController.m
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - GUI Button press handlers
- (IBAction)cancelarPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)agregarPressed:(id)sender {
}

@end
