/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAViewController.m
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

#import "JAViewController.h"
#import "JAGridView.h"

@interface JAViewController ()

@property (nonatomic, strong) NSArray *imageDataArray;

- (NSArray *)_generateImageDataArray;

@end

@implementation JAViewController

@synthesize imageDataArray;

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    self = [super initWithNibName:nibName bundle:nibBundle];
    
    if (self) {
        self.imageDataArray = [self _generateImageDataArray];
    }
    return self;
}

- (void)loadView
{
    self.view = [[JAGridView alloc] initWithFrame:[[UIScreen mainScreen] bounds] andDelegate:self];
}

#pragma mark - JAGridViewDelegate Methods
- (CGFloat)numberOfRowsInGridView:(JAGridView *)gridView
{
    return [self.imageDataArray count];
}

- (CGFloat)gridView:(JAGridView *)gridView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (NSArray *)imageDataArrayForGridView:(JAGridView *)gridView
{
    return self.imageDataArray;
}

- (NSArray *)_generateImageDataArray
{
    // Simulating RESTful API response object...
    return [NSArray arrayWithObjects:
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/mercury-glass-tealights.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:665], @"width",
                                   [NSNumber numberWithUnsignedInteger:638], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/albion_burl_slice_tables.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:824], @"width",
                                   [NSNumber numberWithUnsignedInteger:791], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Antlerlamps300crop.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1006], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/antlercandlestick_pillarholders.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1006], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/EPSON151.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1006], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Belljar.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:450], @"width",
                                   [NSNumber numberWithUnsignedInteger:432], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Berlin_pendant_Page103_I10.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1006], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/rugmduckredcream_2_largevert.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:339], @"width",
                                   [NSNumber numberWithUnsignedInteger:480], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Big_Sur_Table_1.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:631], @"width",
                                   [NSNumber numberWithUnsignedInteger:606], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/birdcage_lights_crop.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1006], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/AR-S-RS_G1-BLK_WT-Topshot.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:724], @"width",
                                   [NSNumber numberWithUnsignedInteger:966], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/w1_cfh034_3_e255_3_blue.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:674], @"width",
                                   [NSNumber numberWithUnsignedInteger:647], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/B007-3_E255-3_Stripe_Blue.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1024], @"width",
                                   [NSNumber numberWithUnsignedInteger:983], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/braided_cord_pendant_lampsCrop_1.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:754], @"width",
                                   [NSNumber numberWithUnsignedInteger:724], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Brighton_CU.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1024], @"width",
                                   [NSNumber numberWithUnsignedInteger:1024], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/antler_candlecrop.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:356], @"width",
                                   [NSNumber numberWithUnsignedInteger:342], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/bullseye_ottomangrey_1.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:469], @"width",
                                   [NSNumber numberWithUnsignedInteger:450], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/Calistoga_Page36_cropGL527_528_529.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:1024], @"width",
                                   [NSNumber numberWithUnsignedInteger:983], @"height", nil],
                                  
                                  [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"http://cdn.shopify.com/s/files/1/0018/9832/products/clear_glass_pendan.jpg?101110", @"image_url",
                                   [NSNumber numberWithUnsignedInteger:501], @"width",
                                   [NSNumber numberWithUnsignedInteger:633], @"height", nil], nil];
}

@end
