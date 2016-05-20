//
//  QYModel.h
//  QY智慧栾川
//
//  Created by qingyun on 16/4/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYModel : NSObject

@property (nonatomic ,strong)NSString *cover;

@property (nonatomic ,strong)NSString *create;

@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *origin;

@property (nonatomic ,strong)NSString *video;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
