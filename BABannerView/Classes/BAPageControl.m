//
//  BAPageControl.m
//  BABannerView
//
//  Created by Barry Allen on 2018/11/20.
//  Copyright © 2018 Barry Allen. All rights reserved.
//

#import "BAPageControl.h"

/*
 * 定义自适应的全系列iPhone的尺寸
 */
//屏幕  宽  高
#define BA_SCREEN_WIDTH              ([[UIScreen mainScreen] bounds].size.width)
#define BA_SCREEN_HEIGHT             ([[UIScreen mainScreen] bounds].size.height)
#define iPhoneRatio ((BA_SCREEN_WIDTH == 414.0) ? 1.1 : ((BA_SCREEN_WIDTH == 375.0) ? 1.0 : ((BA_SCREEN_WIDTH == 320.0) ? 0.86 : 1.3)))

#define dotW (18 * iPhoneRatio)// 圆点宽
#define dotH (6 * iPhoneRatio)  // 圆点高
#define magrin (5 * iPhoneRatio)    // 圆点间距

@implementation BAPageControl

/*
 * 创建一个类，继承于UIPageControl
 * 重写init方法，记得设置 self.userInteractionEnabled = NO; 否则UIPageController可以被点击
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

/*
 * 最后重写set方法，修改他的样式（大小，圆角都可以设置，位置，背景图等）
 */

- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    
    /*
     * 获取BAPageViewControl下的每一个subviews进行修改
     */
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
    {
        UIImageView *subview = [self.subviews objectAtIndex:subviewIndex];
        if (subviewIndex == currentPage)
        {
            subview.layer.cornerRadius = 2.8 * iPhoneRatio;
            subview.layer.masksToBounds = YES;

        }
        /*
         * 其他的背景颜色发生改变
         */
        else
        {
            subview.layer.cornerRadius = 2.8 * iPhoneRatio;
            subview.layer.masksToBounds = YES;
        }
    }
}

/*
 * 改变轮播图的间距
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算圆点间距
    CGFloat marginX = dotW + magrin;

    CGSize size;

    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;

    //设置新frame
    self.frame = CGRectMake(BA_SCREEN_WIDTH/2-(newW + dotW)/2, self.frame.origin.y, newW + dotW, self.frame.size.height);

    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];

        if (i == self.currentPage) {
            size.height = 6 * iPhoneRatio;
            size.width = 18 * iPhoneRatio;
            [dot setFrame:CGRectMake( i * marginX - 4.5 * iPhoneRatio, dot.frame.origin.y, size.width, size.height)];
        }else {
            size.height = 6 * iPhoneRatio;
            size.width = 8 * iPhoneRatio;
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, size.width, size.height)];
        }
    }

}

@end
