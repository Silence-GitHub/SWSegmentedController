//
//  ViewController2.m
//  SWSegmentedController
//
//  Created by Kaibo Lu on 16/5/5.
//  Copyright © 2016年 Kaibo Lu. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (IBAction)buttonPressed:(UIButton *)sender {
    
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"View controller"];
    ViewController1 *vc1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"View controller 1"];
    
    self.segmentedController.viewControllers = @[vc, vc1];
}

- (void)setup {
    self.label.text = @"View controller 2";
    [self.button setTitle:@"Set view controller and view controller 1" forState:UIControlStateNormal];
}

@end
