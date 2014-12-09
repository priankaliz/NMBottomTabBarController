//
//  ViewController.m
//  NMBottomTabBarExample
//
//  Created by Prianka Liz Kariat on 04/12/14.
//  Copyright (c) 2014 Prianka Liz. All rights reserved.
//

#import "NMBottomTabBarController.h"

@interface NMBottomTabBarController ()

@end

@implementation NMBottomTabBarController
@synthesize controllers = _controllers;

-(id)init{
    
    self = [super init];
    if(self){
       
        
    }
    return self;
}
-(void)awakeFromNib{

    self.tabBar = [NMBottomTabBar new];
    selectedIndex = -1;
    self.controllers = [NSArray new];
    [self.view addSubview:self.tabBar];
    
    containerView = [UIView new];
    [self.view addSubview:containerView];
    
    [self setUpConstraintsForContainerView];
    [self setUpConstraintsForTabBar];
    
    [self.tabBar setDelegate:self];
    

  
}

-(void)setControllers:(NSArray *)controllers{
    
    _controllers = controllers;
     [self.tabBar layoutTabWihNumberOfButtons:self.controllers.count];

}

- (void)viewDidLoad {
    [super viewDidLoad];
  

    
  

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUpConstraintsForTabBar{
    
    NMBottomTabBar *tempTabBar = self.tabBar;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[tempTabBar(==50)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tempTabBar]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar)]];
    [tempTabBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view setNeedsLayout];

    
}
-(void)setUpConstraintsForContainerView {
    
    NMBottomTabBar *tempTabBar = self.tabBar;

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-[tempTabBar]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar,containerView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(containerView)]];
    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view setNeedsLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)selectTabAtIndex:(NSInteger)index{
   
   [self.tabBar setTabSelectedWithIndex:index];
}
-(void)didSelectTabAtIndex:(NSInteger)index{

     if(selectedIndex == -1){
        
        UIViewController *destinationController = [self.controllers objectAtIndex:index];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [containerView addSubview:destinationController.view];
        [self setUpContsraintsForDestinationCOntrollerView:destinationController.view];
        selectedIndex = index;
        
    }
    else if(selectedIndex != index){
        
        UIViewController *sourceController = [self.controllers objectAtIndex:selectedIndex];
        UIViewController *destinationController = [self.controllers objectAtIndex:index];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [self transitionFromViewController:sourceController toViewController:destinationController duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
        
        } completion:^(BOOL finished) {
            
            [sourceController willMoveToParentViewController:nil];
            [sourceController removeFromParentViewController];
           
            [self setUpContsraintsForDestinationCOntrollerView:destinationController.view];
            selectedIndex = index;
            if([self.delegate respondsToSelector:@selector(didSelectTabAtIndex:)]){
                
                [self.delegate didSelectTabAtIndex:selectedIndex];
            
            }
        }];
        
    }

   
}
-(BOOL)shouldSelectTabAtIndex:(NSInteger)index{
    
    if([self.delegate respondsToSelector:@selector(shouldSelectTabAtIndex:)]){
    
    return [self.delegate shouldSelectTabAtIndex:index];
    }
    return YES;
    
}
-(void)setUpContsraintsForDestinationCOntrollerView : (UIView *)view {
    
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [containerView setNeedsLayout];

}


@end
