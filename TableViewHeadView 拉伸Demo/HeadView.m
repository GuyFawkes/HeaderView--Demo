//
//  HeadView.m
//  TableViewHeadView 拉伸Demo
//
//  Created by Guy Fawkes on 15/9/13.
//  Copyright (c) 2015年 Guy Fawkes. All rights reserved.
//

#import "HeadView.h"

@interface HeadView (){
    CGRect initFrame;
    CGFloat viewHeight;
}

//@property (nonatomic,assign)CGRect initFram;
//@property (nonatomic,assign)CGFloat viewHeight;

@end

@implementation HeadView

@synthesize tableView = _tableView;
@synthesize view = _view;


-(void)headViewForTableView:(UITableView *)tableView WithView:(UIView *)view subView:(UIView *)subview
{
    self.tableView = tableView;
    self.view = view;
    
    initFrame = self.view.frame;
    viewHeight = initFrame.size.height;
    
    UIView *tableHeadView = [[UIView alloc]initWithFrame:initFrame];
//    UIView *tableHeadView = [[UIView alloc]initWithFrame:initFrame];
    
    self.tableView.tableHeaderView = tableHeadView;
    
    [self.tableView addSubview:self.view];
    [self.tableView addSubview:subview];
}


-(void)scrollViewDidScroll:(UIScrollView*)scrollView;
{
    CGRect f     = self.view.frame;
    f.size.width = self.tableView.frame.size.width;
    self.view.frame  = f;
    
    
    
    if (scrollView.contentOffset.y < 0)
    {
        CGFloat offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top);
        initFrame.origin.y = - offsetY * 1;
        initFrame.origin.x = - offsetY / 2;
        
        initFrame.size.width = _tableView.frame.size.width + offsetY;
        initFrame.size.height = viewHeight + offsetY;
        
        self.view.frame = initFrame;
    }
}


-(void)resizeView
{
    initFrame.size.width = self.tableView.frame.size.width;
    self.view.frame = initFrame;
}










@end




















