//
//  AppDelegate.m
//  NMBottomTabBarControllerExample
//
//  Created by Prianka Liz Kariat on 05/12/14.
//  Copyright (c) 2014 Prianka Liz. All rights reserved.
//

#import "AppDelegate.h"
#import "NMBottomTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *oneController = [UIViewController new];
    oneController.view.backgroundColor = [UIColor greenColor];
    UIViewController *twoController = [UIViewController new];
    twoController.view.backgroundColor = [UIColor blueColor];
    UIViewController *threeController = [UIViewController new];
    threeController.view.backgroundColor = [UIColor purpleColor];
    UIViewController *fourController = [UIViewController new];
    fourController.view.backgroundColor = [UIColor orangeColor];
    NMBottomTabBarController *tabBarController = (NMBottomTabBarController *)self.window.rootViewController;
    
    
    tabBarController.tabBar.separatorImage = [UIImage imageNamed:@"separator.jpg"];

    tabBarController.controllers = [NSArray arrayWithObjects:oneController,twoController,threeController,fourController, nil];
    tabBarController.delegate = self;
    [tabBarController.tabBar configureTabAtIndex:0 andTitleOrientation :kTitleToRightOfIcon  withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"home"]  andText:@"Home"andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
    [tabBarController.tabBar configureTabAtIndex:1 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"profile"]  andText:@"Profile" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
    [tabBarController.tabBar configureTabAtIndex:2 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"settings"]  andText:@"Settings" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
    [tabBarController.tabBar configureTabAtIndex:3 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"calendar"]  andText:@"Calendar" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
    
    [tabBarController selectTabAtIndex:0];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
