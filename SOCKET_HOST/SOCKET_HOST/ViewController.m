//
//  ViewController.m
//  SOCKET_HOST
//
//  Created by mtgto on 6/17/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"

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

- (IBAction)pushListen:(id)sender {
    socketQueue = dispatch_queue_create("socketQueue", NULL);
    GCDAsyncSocket *socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError* error = nil;
    if (![socket acceptOnPort:12345 error:&error]) {
        NSLog(@"failed to accept socket.");
        self.valueField.text = @"failed to accept socket.";
    }
}

- (void)socket:(GCDAsyncSocket *)sender didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    NSString *host = [newSocket connectedHost];
    UInt16 port = [newSocket connectedPort];
    NSLog(@"accept from %@:%d", host, port);
    self.valueField.text = [NSString stringWithFormat:@"accept from %@:%d", host, port];
    NSData *helloData = [@"Hello! i'm SOCKET_HOST!\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [newSocket writeData:helloData withTimeout:5 tag:1];
    [newSocket readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    if (tag == 0) {
        [sock readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
    }
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    // echo
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
            NSString *str = [NSString stringWithUTF8String:[data bytes]];
            self.valueField.text = str;
            NSLog(@"receive: %@", str);
        }
    });
    [sock writeData:data withTimeout:-1 tag:0];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
            self.valueField.text = @"socket is didsconnected";
        }
    });
}
@end
