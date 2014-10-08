//
//  AddViewController.m
//  Tudu
//
//  Created by Alejandro Cárdenas on 10/7/14.
//  Copyright (c) 2014 acib708. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfNota;

@end

@implementation AddViewController
@synthesize tudu = _tudu, tfNombre = _tfNombre, tfNota = _tfNota;

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
    // Incomplete data, show alert!
    if([_tfNota.text isEqualToString:@""] || [_tfNombre.text isEqualToString:@""])
        [[[UIAlertView alloc] initWithTitle:@"Datos incompletos"
                                    message:@"Llena todos los datos del tudu!"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    // Correct data, create Tudu object, and then call unwind segue
    else{
        _tudu = [[Tudu alloc] initWithNombre:_tfNombre.text
                                        nota:_tfNota.text
                                  completado:NO];
        [self performSegueWithIdentifier:@"unwindToTudu" sender:self];
    }
}

@end
