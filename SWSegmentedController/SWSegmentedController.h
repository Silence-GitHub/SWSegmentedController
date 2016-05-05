//
//  SWSegmentedController.h
//  SWSegmentedController
//
//  Created by Kaibo Lu on 16/5/5.
//  Copyright © 2016年 Kaibo Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWSegmentedController : UIViewController

@property (nonatomic, strong, readonly) UISegmentedControl *segmentedControl;
@property (nonatomic, copy) NSArray<__kindof UIViewController *> *viewControllers;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic, strong, readonly) UIViewController *contentViewController; // view controller displaying content
@property (nonatomic, strong, readonly) UIView *contentView; // for content view controller

- (instancetype)initWithControllers:(NSArray<__kindof UIViewController *> *)controllers;

@end

@interface UIViewController (SWSegmentedItem)

@property (nonatomic, weak, readonly) SWSegmentedController *segmentedController;

@end
