//
//  ViewController.m
//  SHM_HOST
//
//  Created by mtgto on 6/17/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import "ViewController.h"
#include <sys/mman.h>
#include <sys/fcntl.h>
#include <sys/stat.h>

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
    [self setValueField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pushWrite:(id)sender {
    const char *message = [self.valueField.text UTF8String];
    struct stat stat;
    char *ptr;
    int fd = shm_open("SHM", O_RDWR|O_CREAT, 0666);
    ftruncate(fd, 1024);
    fstat(fd, &stat);
    ptr = mmap(NULL, stat.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);
    strcpy(ptr, message);
}
@end
