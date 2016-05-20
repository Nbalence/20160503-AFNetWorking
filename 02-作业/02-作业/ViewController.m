//
//  ViewController.m
//  02-作业
//
//  Created by qingyun on 16/5/3.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYViewCell.h"
#import "QYMode.h"
#define KbaseUrl @"http://www.zhihuiluanchuan.com/index.php?s=/Api/document/zxrd&page=1"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
//存数数据mode
@property(strong,nonatomic)NSMutableArray *dataArr;
@end

@implementation ViewController

#pragma mark 获取网络数据
-(void)requestNetWork{
   //1.创建seession
    NSURLSession *seesion=[NSURLSession sharedSession];
    
   //2.创建任务
    NSURLSessionDataTask *task=[seesion dataTaskWithURL:[NSURL URLWithString:KbaseUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"====%@",error);
            return ;
        }
        //将data====》json模型
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"====%@",dic);
        //取出字典对应数组的值
        NSArray *tempArr=dic[@"data"];
        //字典转模型
        for (NSDictionary *temDic in tempArr) {
            QYMode *mode=[QYMode new];
            [mode setValuesForKeysWithDictionary:temDic];
            
            [self.dataArr addObject:mode];
        }
        //更新tableview
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_myTableView reloadData];
            
        });
        
    }];
    
    //3.启动
    [task resume];

}




- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[NSMutableArray array];
    [self requestNetWork];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier=@"cell";
    QYViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"QYViewCell" owner:nil options:nil][0];
    }
    
    //刷新数据
    
    cell.mode=_dataArr[indexPath.row];
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
