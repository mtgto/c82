//
//  ViewController.m
//  NOTIFY_GUEST
//
//  Created by mtgto on 7/8/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import "ViewController.h"
#import "CPDistributedMessagingCenter.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)pushSend:(id)sender {
    CPDistributedMessagingCenter *messagingCenter;
    messagingCenter = [CPDistributedMessagingCenter centerNamed:@"net.mtgto.messagecenter"];
    
    [messagingCenter sendMessageName:@"messageThatHasInfo" userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil]];
}

@end
