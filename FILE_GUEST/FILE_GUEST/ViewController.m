//
//  ViewController.m
//  FILE_GUEST
//
//  Created by mtgto on 7/8/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize valueField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)openFile:(id)sender {
    NSString *path = valueField.text;
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:path	
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    if (error) {
        [[[UIAlertView alloc] initWithTitle:@"error" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
        NSLog(@"error: %@", error);
    } else {
        [[[UIAlertView alloc] initWithTitle:@"success" message:content delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
        NSLog(@"content: %@", content);
    }
}

@end
