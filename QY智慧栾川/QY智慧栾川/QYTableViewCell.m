//
//  QYTableViewCell.m
//  QY智慧栾川
//
//  Created by qingyun on 16/4/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTableViewCell.h"
#import "QYModel.h"
@interface QYTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViews;

@end

@implementation QYTableViewCell


-(void)setModel:(QYModel *)model{
    _model = model;
    NSURL *url = [NSURL URLWithString:model.cover];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    _titleLable.text = model.title;
    _imageViews.image = [UIImage imageWithData:data];
    _nameLabel.text = model.origin;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
