//
//  LayoutGuildReplaceViewController.m
//  Demo
//
//  Created by Phil on 2018/6/13.
//  Copyright © 2018年 Senao. All rights reserved.
//

#import "LayoutGuildReplaceViewController.h"

@interface LayoutGuildReplaceViewController ()

@end

@implementation LayoutGuildReplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self replaceConstraintsRelativeToLayoutGuild];
}

-(void)replaceConstraintsRelativeToLayoutGuild{
    if (@available(iOS 11.0, *))
        return;
    for(NSLayoutConstraint *c in self.view.constraints){
        if(c.secondAttribute == NSLayoutAttributeTopMargin && c.secondItem == self.view){
            NSLog(@"TopMargin");
            [NSLayoutConstraint deactivateConstraints:@[c]];
            [NSLayoutConstraint constraintWithItem:c.firstItem attribute:c.firstAttribute relatedBy:c.relation toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:c.multiplier constant:c.constant].active = YES;
        }else if(c.firstAttribute == NSLayoutAttributeBottomMargin && c.firstItem == self.view){
            NSLog(@"BottomMargin");
            [NSLayoutConstraint deactivateConstraints:@[c]];
            [NSLayoutConstraint constraintWithItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop relatedBy:c.relation toItem:c.secondItem attribute:c.secondAttribute multiplier:c.multiplier constant:c.constant].active = YES;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
