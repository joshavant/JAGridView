/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAGridTableViewCell.m
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

#import "JAGridTableViewCell.h"
#import "JAGridImage.h"
#import "JAGridImageControl.h"

@interface JAGridTableViewCell ()

@property (nonatomic, assign) JAGridTableViewCellLayout layout;
@property (nonatomic, strong) NSMutableArray *imageControlSubviewArray;

@end

@implementation JAGridTableViewCell

@synthesize layout;
@synthesize imageControlSubviewArray;

- (id)initWithLayout:(JAGridTableViewCellLayout)aLayout
     imageModelArray:(NSArray *)imageModelArray
     reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layout = aLayout;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.imageControlSubviewArray = [NSMutableArray array];
        
        // create controls for all image models, add as subviews, then add to subview container
        __weak JAGridTableViewCell *blockSelf = self;
        [imageModelArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            JAGridImageControl *newImageControl = [[JAGridImageControl alloc] initWithFrame:CGRectZero
                                                                              andImageModel:obj];

            [blockSelf addSubview:newImageControl];
            
            [blockSelf.imageControlSubviewArray addObject:newImageControl];
        }];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if(self.layout == kJAGridTableViewCellDistributed)
    {
        __block CGFloat totalAspect;
        __block NSUInteger currentXOffset = 0;
        __weak JAGridTableViewCell *blockSelf = self;
        
        [self.imageControlSubviewArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            totalAspect += (CGFloat) ((JAGridImageControl *)obj).imageModel.width / ((JAGridImageControl *)obj).imageModel.height;
        }];
        
        [self.imageControlSubviewArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            CGFloat currentAspect = (CGFloat) ((JAGridImageControl *)obj).imageModel.width / ((JAGridImageControl *)obj).imageModel.height;
            
            CGFloat fractionalWidth = (CGFloat) (currentAspect/totalAspect) * blockSelf.bounds.size.width;
            
            CGRect imageControlRect = CGRectMake(currentXOffset,
                                                 0,
                                                 (currentAspect/totalAspect) * blockSelf.bounds.size.width,
                                                 blockSelf.bounds.size.height);
            
            NSLog(@"Image URL: %@", [((JAGridImageControl *)obj).imageModel.imageURL absoluteString]);
            NSLog(@"Positioning image at: x: %f, y: %f, width: %f, height: %f", imageControlRect.origin.x, imageControlRect.origin.y, imageControlRect.size.width, imageControlRect.size.height);
            NSLog(@"\n\n");
            
            [(JAGridImageControl *)obj setFrame:imageControlRect];
            
            currentXOffset += ceil(fractionalWidth);
            
        }];
    }
    else if(self.layout = kJAGridTableViewCellHeroLeft)
    {
        [self.imageControlSubviewArray sortUsingSelector:@selector(compareHeightWithImageControl:)];
        
        // TODO: Implement this.
    }
    else if(self.layout = kJAGridTableViewCellHeroRight)
    {
        // TODO: Implement this, too.
    }
}

@end
