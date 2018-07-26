//
//  DetailViewController.m
//  NotificationCenterInObjectiveC
//
//  Created by Vu Ngoc Cong on 7/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = self.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"name" object:self.nameTextField.text];
    [self.navigationController popViewControllerAnimated:true];
}


@end
