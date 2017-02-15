

//
//  HeadLineTableView.m
//  CodeDog
//
//  Created by zerocpp on 17/1/10.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HeadLineTableView.h"
#import "HeadLineTableCell.h"

@interface HeadLineTableView() <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSArray<HomeHeadlineModel *> *headLineList;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign,nonatomic) NSInteger count;
@end

@implementation HeadLineTableView

-(instancetype)initWithFrame:(CGRect)frame withHeadLineArr:(NSArray *)headLineArr{
    if (self = [super initWithFrame:frame]) {
        _headLineList = headLineArr;
        self.delegate = self;
        self.dataSource = self;
        //去掉分割线左边的间隔
        self.separatorInset = UIEdgeInsetsZero;
        [self registerClass:[HeadLineTableCell class] forCellReuseIdentifier:@"cell"];
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                               forMode:NSDefaultRunLoopMode];
    }
    return self;
}
//CADisplayLink 定时器 系统默认每秒调用60次
- (void) tick:(CADisplayLink *)displayLink {
    
    self.count ++;
    //(25.0 / 30.0) * (float)self.count) ---> (tableview需要滚动的contentOffset / 一共调用的次数) * 第几次调用
    //比如该demo中 contentOffset最大值为 = cell的高度 * cell的个数 ,5秒执行一个循环则调用次数为 300,没1/60秒 count计数器加1,当count=300时,重置count为0,实现循环滚动.
    [self setContentOffset:CGPointMake(0, ((25.0 / 30.0) * (float)self.count)) animated:NO];
    
    if (self.count >= 300) {
        
        self.count = 0;
    }
}

#pragma mark -delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.headLineList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeadLineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HomeHeadlineModel *model = self.headLineList[indexPath.row];
//    [cell.iconIV setImageURL:model.icon.sx_URL];
    cell.titleLb.text = model.title;
    return cell;
}
- (void)dealloc {
    [self.displayLink invalidate];
    self.displayLink = nil;
}
@end
