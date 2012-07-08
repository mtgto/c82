//
//  ViewController.m
//  NOTIFY_HOST
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
    
    CPDistributedMessagingCenter *messagingCenter;
    messagingCenter = [CPDistributedMessagingCenter centerNamed:@"net.mtgto.messagecenter"];
    [messagingCenter runServerOnCurrentThread];
    [messagingCenter registerForMessageName:@"messageThatHasInfo" target:self selector:@selector(handleMessageNamed:withUserInfo:)];
}

- (NSDictionary *)handleMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userinfo {
    [[[UIAlertView alloc] initWithTitle:@"message" message:@"message" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
    return nil;
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

@end
