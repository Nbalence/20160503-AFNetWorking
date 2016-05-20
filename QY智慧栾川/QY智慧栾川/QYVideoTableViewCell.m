//
//  QYVideoTableViewCell.m
//  QY智慧栾川
//
//  Created by qingyun on 16/5/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYVideoTableViewCell.h"
#import "QYModel.h"
@interface QYVideoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIView *videoView;

@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@end

@implementation QYVideoTableViewCell

-(void)setModel:(QYModel *)model{
    _model = model;
    //NSURL *url = [NSURL URLWithString:model.video];
    _timeLable.text = model.title;
    _lable.text = model.origin;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
