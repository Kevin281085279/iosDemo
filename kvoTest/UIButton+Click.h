//
//  UIButton+Click.h
//  kvoTest
//
//  Created by Monph on 2018/8/2.
//  Copyright © 2018年 Monph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Click)

@property (nonatomic,assign) NSTimeInterval durationTime;

@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;

@end
