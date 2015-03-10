//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString * str;
    
    if (lang == 1) {
        str = @"Jugar";
    }else{
        str = @"Play";
    }
    
    int size1;
    int size2;
    if (dev == 1) {
        size1 = 40;
        size2 = 30;
    }else{
        size1 = 22;
        size2 = 20;
    }
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.titleLabel.font = [UIFont fontWithName:@"232MKSDRoundMedium" size:size1];
    
    [self.titleLabel sizeToFit];
    
    if ([self.alphaBtn isEqualToString:@"0"]) {
        [self.btnNew removeFromSuperview];
    }else{
        
        self.btnNew.titleLabel.text = str;
        self.btnNew.titleLabel.font = [UIFont fontWithName:@"232MKSDRoundMedium" size:size2];
        [self.btnNew setTitle:str forState:UIControlStateNormal];
        [self.btnNew setTitle:str forState:UIControlStateSelected];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end