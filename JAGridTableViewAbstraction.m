/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAGridTableViewAbstraction.m
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

#import "JAGridTableViewAbstraction.h"
#import "JAGridTableViewCell.h"
#import "JAGridView.h"

// DEBUG - DEVELOPMENT IMPORT
#import <stdlib.h>

@implementation JAGridTableViewAbstraction

@synthesize imageModelArray;

- (id)initWithImageModelArray:(NSMutableArray *)anImageModelArray
{
    self = [super init];
    if (self) {
        self.imageModelArray = anImageModelArray;
    }
    return self;
}

#pragma mark - UITVDataSource Protocol Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JAGridViewCellIdentifier";
    
    JAGridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *minimalArray = [NSArray arrayWithObjects:
                                 [self.imageModelArray objectAtIndex:arc4random_uniform(19)],
                                 [self.imageModelArray objectAtIndex:arc4random_uniform(19)],
                                 [self.imageModelArray objectAtIndex:arc4random_uniform(19)], nil];
        
        cell = [[JAGridTableViewCell alloc] initWithLayout:kJAGridTableViewCellDistributed
                                           imageModelArray:minimalArray
                                           reuseIdentifier:CellIdentifier];
    }
       
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [((JAGridView *)tableView).gridViewDelegate numberOfRowsInGridView:((JAGridView *)tableView)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [((JAGridView *)tableView).gridViewDelegate gridView:((JAGridView *)tableView) heightForRowAtIndexPath:indexPath];
}



@end
