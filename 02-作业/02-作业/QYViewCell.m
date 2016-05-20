//
//  QYViewCell.m
//  02-作业
//
//  Created by qingyun on 16/5/3.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewCell.h"
#import "QYMode.h"
@interface QYViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourcLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end

@implementation QYViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setMode:(QYMode *)mode{
    if (_mode!=mode) {
     //刷新UI
        

    }
    _mode=mode;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
