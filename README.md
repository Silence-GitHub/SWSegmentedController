# SWSegmentedController

A container view controller with segmented control. It changes content view controller with segmented control or programmatically.



## Major features

### Select content view controller with segmented control
![](https://github.com/Silence-GitHub/SWSegmentedController/blob/master/README_resources/Select_content_view_controller_with_segmented_control.gif)

### Select content view controller programmatically
![](https://github.com/Silence-GitHub/SWSegmentedController/blob/master/README_resources/Select_content_view_controller_programmatically.gif)

### Set content view controllers
![](https://github.com/Silence-GitHub/SWSegmentedController/blob/master/README_resources/Set_content_view_controllers.gif)



## How to use

### Install
```
#import "SWSegmentedController.h"
```

### Initialize
```
SWSegmentedController *segmentedController = [[SWSegmentedController alloc] initWithControllers:@[controller, controller2]];
```

### Or initialize like
```
SWSegmentedController *segmentedController = [[SWSegmentedController alloc] init];
segmentedController.viewControllers = @[controller, controller2];
```

### Change child view controllers
```
segmentedController.viewControllers = @[controller, controller2, controller3];
```

### Get segmented control
```
UISegmentedControl *segmentedControl = segmentedController.segmentedControl;
// Do something to segmented control
```

### DO NOT change selected segment index programmatically
```
// This code changes selected index of segmented control
// dose not change content view controller
// dose not selected index of segmented controller
// It will make these 3 properties not match
segmentedControl.selectedSegmentIndex = 1;
```

### Get content view controller that displaying content
```
UIViewController *contentVC = segmentedController.contentViewController;
```

### Get content view of content view controller
```
UIView *contentView = segmentedController.contentView;
```

### Get selected index
```
NSInteger selectedIndex = segmentedController.selectedIndex;
```

### Set selected index to change content view controller
```
segmentedController.selectedIndex = 1;
```

### Get segmented controller of child view controller
```
SWSegmentedController *segmentedController = controller.segmentedController;
```

