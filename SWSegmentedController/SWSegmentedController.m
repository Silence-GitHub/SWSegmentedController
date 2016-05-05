//
//  SWSegmentedController.m
//  SWSegmentedController
//
//  Created by Kaibo Lu on 16/5/5.
//  Copyright © 2016年 Kaibo Lu. All rights reserved.
//

#import "SWSegmentedController.h"

@interface SWSegmentedController ()

@property (nonatomic, strong, readwrite) UISegmentedControl *segmentedControl;

@end

@implementation SWSegmentedController

#pragma marrk - Properties

const static CGFloat SEGMENTED_CONTROL_TOP_BOTTOM_SPACE = 8.0f;

- (UISegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        NSMutableArray *titles = [[NSMutableArray alloc] initWithCapacity:self.viewControllers.count];
        int i = 0;
        for (UIViewController *vc in self.viewControllers) {
            [titles addObject:(vc.title.length ? vc.title : [NSString stringWithFormat:@"%d", i])];
            ++i;
        }
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
        [_segmentedControl addTarget:self action:@selector(selectSegmentIndex:) forControlEvents:UIControlEventValueChanged];
        _segmentedControl.selectedSegmentIndex = 0;
        [self.view addSubview:_segmentedControl];
    }
    return _segmentedControl;
}

- (void)selectSegmentIndex:(id)sender {
    NSLog(@"Select segment index: %d", _segmentedControl.selectedSegmentIndex);
    
    [self hideViewController:self.viewControllers[_selectedIndex]];
    [self displayViewController:self.viewControllers[_segmentedControl.selectedSegmentIndex]];
    _selectedIndex = _segmentedControl.selectedSegmentIndex;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (selectedIndex >= self.viewControllers.count) {
        NSLog(@"SWSegmentedController selected index (%ld) must < number of view controllers (%lu)", (long)selectedIndex, (unsigned long)self.viewControllers.count);
        return;
    }
    [self hideViewController:self.viewControllers[_selectedIndex]];
    [self displayViewController:self.viewControllers[selectedIndex]];
    self.segmentedControl.selectedSegmentIndex = selectedIndex;
    _selectedIndex = selectedIndex;
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    if (viewControllers.count < 2) {
        NSLog(@"Number of controllers of SWSegmentedController must >= 2. Now count = %lu", (unsigned long)viewControllers.count);
        return;
    }
    for (id vc in viewControllers) {
        if (![vc isKindOfClass:[UIViewController class]]) {
            NSLog(@"Controllers of SWSegmentedController must contain UIViewController class type or its subclass type. Now controllers has a object with class: %@", [vc class]);
            return;
        }
    }
    [self hideViewController:_viewControllers[_selectedIndex]];
    [self displayViewController:viewControllers.firstObject];
    _viewControllers = viewControllers;
    _selectedIndex = 0;
    [self.segmentedControl removeFromSuperview];
    self.segmentedControl = nil;
    self.segmentedControl.selectedSegmentIndex = 0;
}

- (UIViewController *)contentViewController {
    return self.viewControllers[_selectedIndex];
}

- (UIView *)contentView {
    return self.contentViewController.view;
}

#pragma mark - View controller life cycle

- (instancetype)initWithControllers:(NSArray<__kindof UIViewController *> *)controllers {
    // Check whether number of controllers is enough
    if (controllers.count < 2) {
        NSLog(@"Number of controllers of SWSegmentedController must >= 2. Now count = %lu", (unsigned long)controllers.count);
        return nil;
    }
    // Check type of controller
    for (id vc in controllers) {
        if (![vc isKindOfClass:[UIViewController class]]) {
            NSLog(@"Controllers of SWSegmentedController must contain UIViewController class type or its subclass type. Now controllers has a object with class: %@", [vc class]);
            return nil;
        }
    }
    
    // Init
    self = [super init];
    if (self) {
        _viewControllers = controllers;
        _selectedIndex = 0;
        [self displayViewController:controllers.firstObject];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews {
    
    self.segmentedControl.center = CGPointMake(self.view.center.x, [self.topLayoutGuide length] + SEGMENTED_CONTROL_TOP_BOTTOM_SPACE + self.segmentedControl.bounds.size.height / 2);
    self.contentView.frame = self.frameForContentController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Manage view controllers

- (void)displayViewController:(UIViewController *)controller {
    
    [self addChildViewController:controller];
    
    controller.view.frame = [self frameForContentController];
    [self.view addSubview:controller.view];
    self.title = controller.title;
    
    [controller didMoveToParentViewController:self];
}

- (CGRect)frameForContentController {
    CGFloat y = CGRectGetMaxY(self.segmentedControl.frame) + SEGMENTED_CONTROL_TOP_BOTTOM_SPACE;
    return CGRectMake(0, y, self.view.bounds.size.width, self.view.bounds.size.height - y);
}

- (void)hideViewController:(UIViewController *)controller {
    
    [controller willMoveToParentViewController:nil];
    
    [controller.view removeFromSuperview];
    self.title = nil;
    
    [controller removeFromParentViewController];
}

@end

#pragma mark - UIViewController + SWSegmentedItem catogory

@implementation UIViewController (SWSegmentedItem)

- (SWSegmentedController *)segmentedController {
    id parentVC = self.parentViewController;
    while (YES) {
        if (parentVC == nil || [parentVC isKindOfClass:[SWSegmentedController class]]) {
            return parentVC;
        }
        parentVC = ((UIViewController *)parentVC).parentViewController;
    }
}

@end
