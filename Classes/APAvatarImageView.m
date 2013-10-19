//
//  APAvatarImageView.m
//  Avatar
//
//  Created by Ankur Patel on 10/19/13.
//  Copyright (c) 2013 Patel Labs LLC. All rights reserved.
//

#import "APAvatarImageView.h"

@interface APAvatarImageView ()

@property (nonatomic, retain) CALayer *roundBorderLayer;

- (void)draw;

@end

@implementation APAvatarImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self draw];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _borderWidth = -1.0;
        [self draw];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        [self draw];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    self = [super initWithImage:image];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        [self draw];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        [self draw];
    }
    return self;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self draw];
}

- (void)setBorderWidth:(float)borderWidth
{
    _borderWidth = borderWidth;
    [self draw];
}

- (void)draw
{
    CGRect frame = self.frame;
    if (frame.size.width != frame.size.height) {
        NSLog(@"Warning: Height and Width should be the same for image view");
    }
    [_roundBorderLayer removeFromSuperlayer];
    _roundBorderLayer = [self layer];
    [_roundBorderLayer removeFromSuperlayer];
    [_roundBorderLayer setMasksToBounds:YES];
    [_roundBorderLayer setCornerRadius:(frame.size.height / 2)];
    if (_borderWidth < 0) { // Default case
        [_roundBorderLayer setBorderWidth:3.0];
    } else {
        [_roundBorderLayer setBorderWidth:_borderWidth];
    }
    if (_borderColor == nil) {
        [_roundBorderLayer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    } else {
        [_roundBorderLayer setBorderColor:[_borderColor CGColor]];
    }
}

@end
