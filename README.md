NMBottomTabBarController
========================

A customisable tab bar controller for iOS written in Objective C. It uses auto layout.

Requirements
========================
1. iOS 7.1 + 
2. ARC

##### Image Requirements for configuring the tab bar items
1. Icon image
2. Selected and unselected background image 

Features
========================
1. Uses autolayout
2. You can set custom background images, icons and text( custom font and colour) for selected, unselected states of
   the tabs.
3. There are two configurations for the arrangement of text and icon image (Text to the right of icon image and text    to the bottom of icon image)
4. You can assign controllers for each of the tabs.
5. NMBottomTabBarController will take care of the switching and displaying of the controller views when user switches
   the tabs.
6. In addition the tabs can be switched programatically as required.

Installation
========================

1. Please [Download](https://github.com/priankaliz/NMBottomTabBarController/archive/master.zip) the source files
2. Drag and drop the NMBottomTabBarController folder into your project
3. Include ```objective-c #import "NMBottomTabBarController.h" ``` wherever necessary

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
##### To select a particular tab programatically

```objective-c
 [tabBarController selectTabAtIndex:0];
 ```

##### Delegates
There are two delegates available for NMBottomTabBarController

```objective-c
-(BOOL)shouldSelectTabAtIndex : (NSInteger)index;
```
It can be used to determine whether to allow the selection of a particular tab

```objective-c
-(void)didSelectTabAtIndex : (NSInteger)index;
```
It can be used to perform any action once a tab is selected

To Do
========================
1. Set selected and unselected attributed text, icon images
2. Add a more button and display the controllers on next page when the tabs exceed a certain limit.

License
========================
The project is licensed under the MIT license. For more information please see the [LICENSE][https://github.com/priankaliz/NMBottomTabBarController/blob/master/LICENSE] file

Credits
========================
NMBottomTabBarController was developed for a project I work on. 
Please feel free to reach me at priankaliz@gmail.com

