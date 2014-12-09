NMBottomTabBarController
========================

A custom tab bar controller for iOS written in Objective C. It uses auto layout.

Requirements
========================
iOS 7.0 + 
ARC

Features
========================
1. Uses autolayout
2. You can set custom background images, icons and text( custom font and colour) for selected, unselected states of
   the tabs.
3. You can assign controllers for each of the tabs.
4. NMBottomTabBarController will take care of the switching and displaying of the controller views when user switches
   the tabs.
5. In addition the tabs can be switched programatically as required.

Usage
========================

Add a controller and change its custom class to NMBottomTabBarController. 

From the controller where you want to display the tab bar controller you can do the initial set up.

##### To add a set of controllers that the tab bar controller manages

```objective-c
UIViewController *oneController = [UIViewController new];
oneController.view.backgroundColor = [UIColor greenColor];
UIViewController *twoController = [UIViewController new];
twoController.view.backgroundColor = [UIColor blueColor];
UIViewController *threeController = [UIViewController new];
threeController.view.backgroundColor = [UIColor purpleColor];
UIViewController *fourController = [UIViewController new];
fourController.view.backgroundColor = [UIColor orangeColor];

NMBottomTabBarController *tabBarController = (NMBottomTabBarController *)self.window.rootViewController;

tabBarController.controllers = [NSArray arrayWithObjects:oneController,twoController,threeController,fourController, nil];
```
##### To set the separator image used between tabs
```objective-c
 tabBarController.tabBar.separatorImage = [UIImage imageNamed:@"separator.jpg"];
 ```
 ##### Title and Text Orientation
 
 There are two title and text orientations
 1. kTitleToRightOfIcon - Places title to the right of the icon image
 2. kTItleToBottomOfIcon - Places title to the nottom of the icon image
 You can learn how to set these in the next step

 ##### To set custom background images, icon, title text and title text orientation
```objective-c
 [tabBarController.tabBar configureTabAtIndex:0 andTitleOrientation :kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"home"] andText:@"Home"andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
 ```
##### Delegates
There are two delegates available for NMBottomTabBarController

