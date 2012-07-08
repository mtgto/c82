//
//  ViewController.m
//  FILE_HOST
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

- (IBAction)generateFile:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0], @"sample.txt"];
    NSError *error = nil;
    if (![@"sample" writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error]) {
        NSLog(@"failed to write.");
    } else {
        valueField.text = path;
    }
}

@end
