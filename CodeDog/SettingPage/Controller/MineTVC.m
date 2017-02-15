//
//  MineTVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/12.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MineTVC.h"
#import "MyWelcomeVC.h"
#import "SXClearCacheCell.h"
#import "CollectionTVC.h"
#import "IntroduceVC.h"

@interface MineTVC ()

@end

@implementation MineTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:252 / 255.0 blue:255 / 255.0 alpha:1];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[SXClearCacheCell class] forCellReuseIdentifier:@"ClearCacheCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //表示静态cell
    if (indexPath.section == 0 || indexPath.section == 2 ||(indexPath.section == 1 && indexPath.row == 1)) {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        SXClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClearCacheCell"];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            MyWelcomeVC *vc = [MyWelcomeVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            IntroduceVC *vc = [IntroduceVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SXClearCacheCell *cell = (SXClearCacheCell *)[tableView cellForRowAtIndexPath:indexPath];
            [cell clearCache];
        }else{
            CollectionTVC *CVC = [[CollectionTVC alloc]init];
            [self.navigationController pushViewController:CVC animated:YES];
        }
    }
    
    
    
}


@end
