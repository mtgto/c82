//
//  ViewController.h
//  SOCKET_HOST
//
//  Created by mtgto on 6/17/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    dispatch_queue_t socketQueue;
}
@property (weak, nonatomic) IBOutlet UITextField *valueField;
- (IBAction)pushListen:(id)sender;

@end
