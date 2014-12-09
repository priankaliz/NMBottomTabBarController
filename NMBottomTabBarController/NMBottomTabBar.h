//
//  NMBottomTabBar.h
//  NIDOMothers
//
//  Created by Prianka Liz Kariat on 10/11/14.
//  Copyright (c) 2014 Thampy Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum titleOrientation {
    
    kTitleToRightOfIcon = 0,
    kTItleToBottomOfIcon
    
} NMTitleOrientation;



@protocol NMBottomTabBarDelegate <NSObject>

-(void)didSelectTabAtIndex : (NSInteger)index;
-(BOOL)shouldSelectTabAtIndex : (NSInteger)index;

@end

@interface NMBottomTabBar : UIControl{
    
    NSInteger numberOFTabs;
    NSMutableArray *tabButtons;
    NSInteger selectedIndex;
   }


@property (assign, nonatomic) id <NMBottomTabBarDelegate> delegate;
@property (strong, nonatomic) UIImage *separatorImage;

-(void)layoutTabWihNumberOfButtons:(NSInteger)numberOfTabs ;
-(void)configureTabAtIndex : (NSInteger)index andTitleOrientation : (NMTitleOrientation)titleOrientation withUnselectedBackgroundImage : (UIImage *)backImage selectedBackgroundImage : (UIImage *)selecetedBackImage iconImage : (UIImage *)iconImage andText : (NSString *)text andTextFont:(UIFont *)font andFontColour:(UIColor *)color;
-(void)setTabSelectedWithIndex : (NSInteger)index;



@end
