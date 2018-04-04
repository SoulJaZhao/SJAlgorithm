//
//  ViewController.m
//  SJAlgorithm
//
//  Created by SoulJa on 2018/4/4.
//  Copyright © 2018年 soulja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@24,@13,@26,@5,@7,@15];
    
//    NSArray *sortedArray = [self bubbleSortingWithArray:array];
//    NSArray *sortedArray = [self selectSortingWithArray:array];
    NSArray *sortedArray = [self directInsertSortingWithArray:array];
    NSLog(@"%@",sortedArray);
}


#pragma mark - 冒泡排序法
- (NSArray *)bubbleSortingWithArray:(NSArray *)array {
    NSMutableArray *arrayM = [array mutableCopy];
    BOOL isUnsorted = YES;
    // 只需要n-1趟
    for (NSInteger i = 0; i < arrayM.count - 1; i++) {
        isUnsorted = NO;
        // 经过第i趟，下标为i的元素已经比后面的元素都要小
        for (NSInteger j = arrayM.count - 1; j > i; j--) {
            // 比较相邻的两元素
            if ([arrayM[j] intValue] < [arrayM[j-1] intValue]) {
                // 把小的往前移
                [arrayM exchangeObjectAtIndex:j withObjectAtIndex:j-1];
                isUnsorted = YES;
            }
        }
    }
    return [arrayM copy];
}

#pragma mark - 选择排序法
- (NSArray *)selectSortingWithArray:(NSArray *)array {
    NSMutableArray *arrayM = [array mutableCopy];
    NSInteger minNumIdx;
    // 只需要 n-1 趟
    for (NSInteger i = 0; i < arrayM.count - 1; i++) {
        // 先假设剩下元素中的第一个是最小的
        minNumIdx = i;
        for (NSInteger j = i + 1; j < arrayM.count; j++) {
            // 从前往后，将每个元素与最小的那个比较
            if ([arrayM[j] intValue] < [arrayM[minNumIdx] intValue]) {
                // 如果某元素比minNumIdx位置更小，更新minNumIdx
                minNumIdx = j;
            }
        }
        // 如果minNumIdx与i不等，说明有比i位置更小的，则交换两者
        if (minNumIdx != i) {
            [arrayM exchangeObjectAtIndex:i withObjectAtIndex:minNumIdx];
        }
    }
    return [arrayM copy];
}

#pragma mark - 直接排序排序法
- (NSArray *)directInsertSortingWithArray:(NSArray *)array {
    NSMutableArray *arrayM = [array mutableCopy];
    // 只需要 n-1 趟,假设第一个元素是有序的
    for (NSInteger i = 1; i <= arrayM.count - 1; ++i) {
        // 如果某元素比前面已排序的数组中最后（最大）的元素要小，则需要将该元素插入其中
        if ([arrayM[i] intValue] < [arrayM[i-1] intValue]) {
            // 记录要插入的元素的值
            NSInteger numNeedInserted = [arrayM[i] intValue];
            
            NSInteger j;
            for (j = i; j >0 && [arrayM[j - 1] intValue] > numNeedInserted; j--) {
                // 在已排序的数组中，从后往前，只要比要插入的元素的值大，就向后移动一位
                arrayM[j] = arrayM[j-1];
            }
            // 将要插入的元素插入到遇到的第一个比它小的元素的后面，如果没有，则插入到最前面
            arrayM[j] = @(numNeedInserted);
        }
    }
    return [arrayM copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
