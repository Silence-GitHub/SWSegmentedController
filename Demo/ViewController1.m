//
//  ViewController1.m
//  SWSegmentedController
//
//  Created by Kaibo Lu on 16/5/5.
//  Copyright © 2016年 Kaibo Lu. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (IBAction)buttonPressed:(UIButton *)sender {
    
    ViewController2 *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"View controller 2"];
    self.segmentedController.viewControllers = @[vc, vc, vc];
}

- (void)setup {
    self.label.text = @"View controller 1";
    [self.button setTitle:@"Set 3 view controller 2" forState:UIControlStateNormal];
}

@end
