//
//  QYMode.m
//  02-作业
//
//  Created by qingyun on 16/5/3.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYMode.h"

@implementation QYMode

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//做异常处理
    if ([key isEqualToString:@"id"]) {
        _Id=value;
    }

}


@end
