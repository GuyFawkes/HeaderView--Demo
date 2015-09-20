//
//  ViewController.m
//  TableViewHeadView 拉伸Demo
//
//  Created by Guy Fawkes on 15/9/13.
//  Copyright (c) 2015年 Guy Fawkes. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"


#define headViewHeight 200
#define mainScreenW [UIScreen mainScreen].bounds.size.width
#define mainScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *testTableview;
@property (nonatomic,strong)HeadView *headView;

@end

@implementation ViewController

-(UITableView *)testTableview
{
    if (!_testTableview)
    {
        _testTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        
        _testTableview.delegate = self;
        _testTableview.dataSource = self;
        
        [self.view addSubview:_testTableview];
    }
    return _testTableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"赵日天";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.testTableview.frame = self.view.frame;
    [self.view addSubview:self.testTableview];
    
    [self testTableview];
    [self initHeadVIew];
}

-(void)initHeadVIew
{
    //背景
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainScreenW, headViewHeight)];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = [UIImage imageNamed:@"test"];
    
    
    //背景之上的内容
    UIButton *contentView = [[UIButton alloc] initWithFrame:bgImageView.bounds];
    
    
    [contentView setTitle:@"点击就送huitime🐶" forState:0];
    [contentView setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    
    contentView.backgroundColor = [UIColor clearColor];
    
    self.headView = [HeadView new];
    [self.headView  headViewForTableView:self.testTableview WithView:bgImageView subView:contentView];
    
    //遮盖点击事件
    [contentView addTarget:self action:@selector(VIewClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)VIewClick
{
    NSLog(@"点击封面换");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table delegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = @"赵日天";
    
    return cell;

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - headViewMethod

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.headView scrollViewDidScroll:scrollView];
}


-(void)viewDidLayoutSubviews
{
    [self.headView resizeView];
}












@end
