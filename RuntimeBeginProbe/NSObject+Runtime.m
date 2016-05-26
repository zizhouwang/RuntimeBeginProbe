//
//  NSObject+Runtime.m
//  RuntimeBeginProbe
//
//  Created by wzzyinqiang on 16/5/25.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Runtime)

- (NSString*)tag_str {
    return objc_getAssociatedObject(self, @"tag_str");
}

- (void)setTag_str:(NSString *)tag_str {
    objc_setAssociatedObject(self, @"tag_str", tag_str, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
