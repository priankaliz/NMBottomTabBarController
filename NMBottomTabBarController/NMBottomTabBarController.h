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

-(BOOL)shouldSelectTabAtIndex : (NSInteger)index;
-(void)didSelectTabAtIndex : (NSInteger)index;

@end

@interface NMBottomTabBarController : UIViewController <NMBottomTabBarDelegate>{
    
    NSInteger selectedIndex;
    UIView *containerView;
}
@property (strong, nonatomic) NSArray *controllers;
@property (strong, nonatomic) NMBottomTabBar *tabBar;
@property (assign, nonatomic) id <NMBottomTabBarControllerDelegate> delegate;
-(void)selectTabAtIndex : (NSInteger)index;


@end

