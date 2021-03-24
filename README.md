# LayoutGuildReplaceViewController

Solve the safe area issue in iOS10.0.

'''objc
-(void) replaceConstraintsRelativeToLayoutGuild;

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
'''
