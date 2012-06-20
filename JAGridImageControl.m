/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAGridImageControl.m
 *
 *  Copyright (c) 2012 Josh Avant
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.
 *
 *  If we meet some day, and you think this stuff is worth it, you can buy me a
 *  beer in return.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#import "JAGridImageControl.h"
#import "UIImageView+AFNetworking.h"
#import "JAGridImage.h"

@interface JAGridImageControl ()

@property (nonatomic, strong) UIImageView *imageView;

- (CGRect)rectForImageViewFrame;

@end

@implementation JAGridImageControl

@synthesize imageModel;
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame andImageModel:(JAGridImage *)anImageModel
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageModel = anImageModel;
        
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.imageView setFrame:[self rectForImageViewFrame]];
        
        [self.imageView setImageWithURL:[imageModel imageURL]];        
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageView setFrame:[self rectForImageViewFrame]];
}

- (CGRect)rectForImageViewFrame
{
    if(CGRectEqualToRect(self.bounds, CGRectZero)) {return CGRectZero;}
    else {return CGRectMake(5, 5, self.bounds.size.width-10, self.bounds.size.height-10);}
}

- (NSComparisonResult)compareHeightWithImageControl:(JAGridImageControl *)imageControl
{
    // these may appear to return inverted results, but that's so the returned array is sorted with
    // the largest element at index 0 (descending order). (`sortUsingSelector:` forcibly sorts in
    // ascending order.)
    if(self.imageModel.height > imageControl.imageModel.height) { return NSOrderedAscending; }
    else if(self.imageModel.height < imageControl.imageModel.height) { return NSOrderedDescending; }
    else { return NSOrderedSame; }
}

@end
