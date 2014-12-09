//
//  ViewController.h
//  NMBottomTabBarExample
//
//  Created by Prianka Liz Kariat on 04/12/14.
//  Copyright (c) 2014 Prianka Liz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMBottomTabBar.h"

@protocol NMBottomTabBarControllerDelegate <NSObject>

@optional

//based on the return value it decides whether tab is to be selected
-(BOOL)shouldSelectTabAtIndex : (NSInteger)index;

// gets called after tab is selected
-(void)didSelectTabAtIndex : (NSInteger)index;

@end

@interface NMBottomTabBarController : UIViewController <NMBottomTabBarDelegate>{
    
    NSInteger selectedIndex;
    UIView *containerView;
}

//Array of Controllers in the tab controller
@property (strong, nonatomic) NSArray *controllers;

// the tab bar view that displays the tab buttons
@property (strong, nonatomic) NMBottomTabBar *tabBar;

//NMBottomTabBarControllerDelegate
@property (assign, nonatomic) id <NMBottomTabBarControllerDelegate> delegate;

//Helps in programatically selecting a tab at the specified index
-(void)selectTabAtIndex : (NSInteger)index;


@end

