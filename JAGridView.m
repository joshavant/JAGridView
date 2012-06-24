/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAGridView.m
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

#import "JAGridView.h"
#import "JAGridTableViewAbstraction.h"
#import "JAGridImage.h"

@interface JAGridView ()

@property (nonatomic, strong) JAGridTableViewAbstraction *abstractionLayer;

- (void)initializeAbstractionLayer;
- (NSMutableArray *)arrayWithSortedModelObjectsFromRawImageDataArray;

@end

@implementation JAGridView

@synthesize abstractionLayer;
@synthesize gridViewDelegate;

- (id)initWithFrame:(CGRect)frame andDelegate:(id<JAGridViewDelegate>)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.gridViewDelegate = aDelegate;
        [self initializeAbstractionLayer];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)initializeAbstractionLayer
{
    NSMutableArray *imageModelArray = [self arrayWithSortedModelObjectsFromRawImageDataArray];
    
    self.abstractionLayer = [[JAGridTableViewAbstraction alloc] initWithImageModelArray:imageModelArray];    

    self.delegate = self.abstractionLayer;
    self.dataSource = self.abstractionLayer;
} 

- (NSMutableArray *)arrayWithSortedModelObjectsFromRawImageDataArray
{
    NSMutableArray *imageModelArray = [NSMutableArray array];
    
    for(NSDictionary *imageDict in [self.gridViewDelegate imageDataArrayForGridView:self])
    {
        JAGridImage *imageModel = [JAGridImage new];
        
        imageModel.imageURL = [NSURL URLWithString:[imageDict objectForKey:@"image_url"]];
        imageModel.width = [[imageDict objectForKey:@"width"] unsignedIntegerValue];
        imageModel.height = [[imageDict objectForKey:@"height"] unsignedIntegerValue];
        
        [imageModelArray addObject:imageModel];
    }
    
    [imageModelArray sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"area" ascending:NO]]];
    
    return imageModelArray;
}

@end