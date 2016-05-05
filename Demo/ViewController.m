//
//  ViewController.m
//  SWSegmentedController
//
//  Created by Kaibo Lu on 16/5/4.
//  Copyright © 2016年 Kaibo Lu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    
    self.segmentedController.selectedIndex = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    self.label.text = @"View controller";
    [self.button setTitle:@"Select view controller 1" forState:UIControlStateNormal];
}

@end
