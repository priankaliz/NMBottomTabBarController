//
//  NMBottomTabBar.m
//  NIDOMothers
//
//  Created by Prianka Liz Kariat on 10/11/14.
//  Copyright (c) 2014 Thampy Digital. All rights reserved.
//

#import "NMBottomTabBar.h"

#define ICON_SPACING 20.0
#define WIDTH_CONSTANT -1.00


@implementation NMBottomTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)init{
    self = [super init];
    if(self){
        
        selectedIndex = -1;
        
        
    }
    return self;

    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if(self){
        
        tabButtons = [[NSMutableArray alloc] init];
        selectedIndex = -1;
    
        
    }
    return self;
}
-(void)layoutTabWihNumberOfButtons:(NSInteger)tabsCount andSeparatorImage : (NSString *)image{
    
    UIImageView *previousSpacerImageView;
    numberOFTabs = tabsCount;
    
    for( int i = 0 ; i <tabsCount ; i++){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:button];
        [button setTag:i+1];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button addTarget:self action:@selector(tabSelected :) forControlEvents:UIControlEventTouchUpInside];
        if(i == 0){
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0]];
        }
        else
        {
            
            NSDictionary *viewsDictionary =
            NSDictionaryOfVariableBindings(previousSpacerImageView,button);
            NSArray *constraints =
            [NSLayoutConstraint constraintsWithVisualFormat:@"[previousSpacerImageView]-0-[button]"
                                                    options:0 metrics:nil views:viewsDictionary];
            [self addConstraints:constraints];
            
            
        }
        CGFloat multiplier = 1.00/tabsCount;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        if(i== tabsCount - 1){
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
        }
        else{
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:multiplier constant:WIDTH_CONSTANT]];
        }
            
        

        if(i < tabsCount-1){
            
            UIImageView *spacerImageView = [[UIImageView alloc] init];
            [self addSubview:spacerImageView];
            [spacerImageView setTag:10 + i+1];
            [spacerImageView setTranslatesAutoresizingMaskIntoConstraints:NO];

            
            NSDictionary *viewsDictionary =
            NSDictionaryOfVariableBindings(button,spacerImageView);
            NSArray *constraints =
            [NSLayoutConstraint constraintsWithVisualFormat:@"[button]-0-[spacerImageView]"
                                                    options:0 metrics:nil views:viewsDictionary];
            [self addConstraints:constraints];
            [self addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"H:[spacerImageView(==1)]"
                                  options:NSLayoutFormatDirectionLeadingToTrailing
                                  metrics:nil
                                  views:NSDictionaryOfVariableBindings(spacerImageView)]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:spacerImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:spacerImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
            previousSpacerImageView = spacerImageView;

        }
}

           [self layoutIfNeeded];

    
}
-(void)layoutSubviews{
    [super layoutSubviews];
  }

-(void)configureTabAtIndex : (NSInteger)index withUnselectedBackgroundImage : (UIImage *)backImage selectedBackgroundImage : (UIImage *)selecetedBackImage iconImage : (UIImage *)iconImage andText : (NSString *)text andTextFont:(UIFont *)font andFontColour:(UIColor *)color{
    
    UIButton *button = (UIButton *)[self viewWithTag:index +1];
    [button setBackgroundImage:backImage forState:UIControlStateNormal];
    [button setBackgroundImage:selecetedBackImage forState:UIControlStateSelected];
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
    [button.titleLabel setTextColor:color];
    CGFloat spacing = ICON_SPACING;
    button.imageEdgeInsets = UIEdgeInsetsMake(0.0, -spacing/2.0, 0.0, 0.0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0.0, spacing/2.0, 0.0, 0.0);
    
}
-(void)tabSelected : (id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    if(selectedIndex != (button.tag -1)){
        
        [button setSelected:!button.selected];
        UIButton *previousTabButton = (UIButton *)[self viewWithTag:selectedIndex + 1];
        [previousTabButton setSelected:!button.selected];
        selectedIndex = button.tag - 1;
        [self.delegate didSelectTabAtIndex:button.tag -1];
    }
}
-(void)setTabSelectedWithIndex:(NSInteger)index{
   
    UIButton *button = (UIButton *)[self viewWithTag:index +1];
    [self tabSelected:button];
}
-(void)setSeparatorWithImage : (UIImage *)image{
    
    for(int i = 11 ; i < (numberOFTabs+10) ; i++){
        
        UIImageView *separatorView = (UIImageView *)[self viewWithTag:i];
        [separatorView setImage:image];
        
    }
}


@end
