//
//  ViewController.m
//  BABannerView
//
//  Created by Barry Allen on 2018/11/20.
//  Copyright © 2018 Barry Allen. All rights reserved.
//

#import "ViewController.h"
#import "BABannerView.h"

#define K_SCREEN_WIDTH              ([[UIScreen mainScreen] bounds].size.width)
#define K_SCREEN_HEIGHT             ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()
    
    @property (nonatomic, strong) BABannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self bannerView];
}
    
    - (BABannerView *)bannerView
    {
        if (!_bannerView)
        {
            _bannerView = [BABannerView bannerView];
            _bannerView.frame = CGRectMake(0, 40, K_SCREEN_WIDTH, 180);
            _bannerView.slImages = @[@"product_news_one",
                                     @"product_news_two",
                                     @"product_news_three",
                                     @"product_news_four",
                                     @"product_news_five"];
            [_bannerView setIndiatorColor:UIColor.redColor];
            [self.view addSubview:_bannerView];
        }
        
        return _bannerView;
    }


@end
