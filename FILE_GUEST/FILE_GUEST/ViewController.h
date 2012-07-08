//
//  ViewController.h
//  FILE_GUEST
//
//  Created by mtgto on 7/8/12.
//  Copyright (c) 2012 mtgto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *valueField;
- (IBAction)openFile:(id)sender;
@end
