//
//  ViewController.m
//  SOCKET_GUEST
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

- (IBAction)pushConnect:(id)sender {
    NSLog(@"pushConnect");
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
	socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    NSError *error = nil;
	if (![socket connectToHost:@"localhost" onPort:12345 error:&error]) {
        NSLog(@"Error connecting: %@", error);
        self.valueField.text = @"接続失敗";
    } else {
        [socket readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    self.valueField.text = [NSString stringWithFormat:@"connected to %@:%d", host, port];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    NSLog(@"wrote");
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSString *str = [NSString stringWithUTF8String:[[data subdataWithRange:NSMakeRange(0, [data length]-2)] bytes]];
    self.valueField.text = str;
    NSLog(@"str = %@", str);
}

- (IBAction)sendMessage:(id)sender {
    NSData *data = [@"Hello, I'm client!\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [socket writeData:data withTimeout:5 tag:0];
    [socket readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
}

@end
