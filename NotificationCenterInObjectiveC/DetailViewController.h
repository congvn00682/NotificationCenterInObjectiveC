//
//  DetailViewController.h
//  NotificationCenterInObjectiveC
//
//  Created by Vu Ngoc Cong on 7/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController

@property NSString *name;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
