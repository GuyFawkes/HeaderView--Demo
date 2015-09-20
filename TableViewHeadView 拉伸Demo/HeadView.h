//
//  HeadView.h
//  TableViewHeadView 拉伸Demo
//
//  Created by Guy Fawkes on 15/9/13.
//  Copyright (c) 2015年 Guy Fawkes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HeadView : NSObject

@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)UIView *view;

-(void)headViewForTableView:(UITableView *)tableView WithView:(UIView *)view subView:(UIView *)subview;

-(void)scrollViewDidScroll:(UIScrollView*)scrollView;


-(void)resizeView;
@end
