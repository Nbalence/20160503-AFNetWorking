//
//  QYVideoViewController.m
//  QY智慧栾川
//
//  Created by qingyun on 16/5/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYVideoViewController.h"
#import "QYVideoTableViewCell.h"
#import "QYModel.h"
#define kURL @"http://www.zhihuiluanchuan.com/index.php?s=/Api/document/zxsp&page=1"

@interface QYVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSArray *datas;

@end

@implementation QYVideoViewController

static NSString *identifier = @"cell";

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.estimatedRowHeight = 120;
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYVideoTableViewCell class]) bundle:nil] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTheReguest];
    
    [self.view addSubview:self.tableView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpTheReguest{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *loadTask = [session dataTaskWithURL:[NSURL URLWithString:kURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                if ([objc isKindOfClass:[NSArray class]]) {
                    NSLog(@"-数组-%@",objc);
                }
                
                if ([objc isKindOfClass:[NSDictionary class]]) {
                    
                     NSLog(@"-字典-%@",objc);
                    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:(NSDictionary *)objc];
                    
                    
                    NSMutableArray *mArr = [NSMutableArray array];
                    NSArray *arr = [dict objectForKey:@"data"];
                    
                    for (NSDictionary *dict in arr) {
                        QYModel *model = [QYModel modelWithDictionary:dict];
                        [mArr addObject:model];
                    }
                
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    });
                    
                }
            }
        }
    }];
    
    [loadTask resume];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
   // return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    QYModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
