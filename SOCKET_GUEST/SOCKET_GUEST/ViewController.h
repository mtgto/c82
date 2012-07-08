//
//  ViewController.h
//  SOCKET_GUEST
//
//  Created by mtgto on 7/8/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface ViewController : UIViewController {
    GCDAsyncSocket *socket;
}
@property (weak, nonatomic) IBOutlet UITextField *valueField;
- (IBAction)pushConnect:(id)sender;
- (IBAction)sendMessage:(id)sender;
@end
