//
//  APViewController.m
//  Avatar
//
//  Created by Ankur Patel on 10/19/13.
//  Copyright (c) 2013 Patel Labs LLC. All rights reserved.
//

#import "APViewController.h"
#import <APAvatarImageView/APAvatarImageView.h>

@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    APAvatarImageView *avatarImageView = [[APAvatarImageView alloc] initWithImage:[UIImage imageNamed:@"profile2"] borderColor:[UIColor blackColor] borderWidth:1.0];
    CGRect frame = avatarImageView.frame;
    frame.origin.x = 90;
    frame.origin.y = 310;
    avatarImageView.frame = frame;
    [self.view addSubview:avatarImageView];
    
    avatarImageView.borderColor = [UIColor brownColor];
    avatarImageView.borderWidth = 3.0;
    avatarImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [avatarImageView addGestureRecognizer:tapGesture];
}

- (IBAction)tapAction:(id)sender {
    [[[UIAlertView alloc]initWithTitle:@"Tap Event" message:@"You tapped on the Avatar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
