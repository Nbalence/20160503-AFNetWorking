//
//  QYModel.m
//  QY智慧栾川
//
//  Created by qingyun on 16/4/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYModel.h"

@implementation QYModel
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _cover = dict[@"cover"];
        _create = dict[@"create_time"];
        _origin = dict[@"origin"];
        _title = dict[@"title"];
        _video = dict[@"video_link"];
    }
    return self;
}

+(instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
