//
//  UILabel+Runtime.m
//  RuntimeBeginProbe
//
//  Created by wzzyinqiang on 16/5/25.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import "UILabel+Runtime.h"
#import "Macros.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UILabel (Runtime)

+ (void)load {
    // 获取两个类的实例方法
    Method m1 = class_getInstanceMethod([UILabel class], @selector(setFont:));
    Method m2 = class_getInstanceMethod([UILabel class], @selector(runtime_setFont:));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
}

- (void)awakeFromNib {
    [self setFont:self.font];
}

- (void)runtime_setFont:(UIFont*)font {
    [self runtime_setFont:[font fontWithSize:font.pointSize * ScreenWidth / 320.0f]];
}

@end
