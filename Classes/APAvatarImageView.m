//
//  APAvatarImageView.m
//  Avatar
//
//  Created by Ankur Patel on 10/19/13.
//  Copyright (c) 2013 Patel Labs LLC. All rights reserved.
//

#import "APAvatarImageView.h"

@implementation APAvatarImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isCircle = YES;
        [self draw];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _borderWidth = -1.0;
        _isCircle = YES;
        [self draw];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    return [self initWithImage:nil highlightedImage:nil borderColor:borderColor borderWidth:borderWidth];
}

- (id)initWithImage:(UIImage *)image borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    return [self initWithImage:image highlightedImage:nil borderColor:borderColor borderWidth:borderWidth];
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor*)borderColor borderWidth:(float)borderWidth
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _isCircle = YES;
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

-(void)setCornerRadius:(float)cornerRadius
{
    _cornerRadius = cornerRadius;
    _isCircle = NO;
    [self draw];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self draw];
}

- (void)draw
{
    CGRect frame = self.frame;
    if (frame.size.width > frame.size.height + 0.5 || frame.size.width < frame.size.height - 0.5) {
        NSLog(@"Warning: Height and Width should be the same within 1 point for image view, but was: %@", NSStringFromCGSize(self.frame.size));
    }
    CALayer *l = [self layer];
    [l setMasksToBounds:YES];
    l.cornerRadius = _isCircle ? (self.frame.size.height/2.0) : _cornerRadius;
    if (_borderWidth < 0) { // Default case
        [l setBorderWidth:3.0];
    } else {
        [l setBorderWidth:_borderWidth];
    }
    if (_borderColor == nil) {
        [l setBorderColor:[[UIColor lightGrayColor] CGColor]];
    } else {
        [l setBorderColor:[_borderColor CGColor]];
    }
}

@end
