//
//  UIImage+GetColor.h
//  iOS8.0之前的UIPopoverController
//
//  Created by chase on 17-12-25.
//  Copyright (c) 2017年 chase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GetColor)
/**
 *  获得某个像素的颜色
 *
 *  @param point 像素点的位置
 */
- (UIColor *)pixelColorAtLocation:(CGPoint)point;
@end
