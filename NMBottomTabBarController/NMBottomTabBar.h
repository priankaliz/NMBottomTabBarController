//
//  NMBottomTabBar.h
//  NIDOMothers
//
//  Created by Prianka Liz Kariat on 10/11/14.
//  Copyright (c) 2014 Thampy Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NMBottomTabBarDelegate <NSObject>

-(void)didSelectTabAtIndex : (NSInteger)index;

@end

@interface NMBottomTabBar : UIControl{
    
    NSInteger numberOFTabs;
    NSMutableArray *tabButtons;
    NSInteger selectedIndex;
}

@property (assign, nonatomic) id <NMBottomTabBarDelegate> delegate;

-(void)layoutTabWihNumberOfButtons:(NSInteger)numberOfTabs andSeparatorImage : (NSString *)image;
-(void)configureTabAtIndex : (NSInteger)index withUnselectedBackgroundImage : (UIImage *)backImage selectedBackgroundImage : (UIImage *)selecetedBackImage iconImage : (UIImage *)iconImage andText : (NSString *)text andTextFont : (UIFont *)font andFontColour : (UIColor *)color;
-(void)setTabSelectedWithIndex : (NSInteger)index;

@end
