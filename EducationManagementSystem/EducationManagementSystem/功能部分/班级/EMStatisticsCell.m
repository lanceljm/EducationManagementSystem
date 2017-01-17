//
//  EMStatisticsCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStatisticsCell.h"
#import "EMIconMarkLabel.h"
#import "PieView.h"
#import "EMDetailController.h"

@interface EMStatisticsCell ()

@property(nonatomic,strong) UILabel *className;
@property(nonatomic,strong) UILabel *classTime;
@property(nonatomic,strong) UILabel *teacherName;
@property(nonatomic,strong) PieView *view;


@end

@implementation EMStatisticsCell

-(void)setModel:(EMStatisticsModel *)model {
    //开始
    NSMutableString *str = [NSMutableString stringWithString:model.curriculumStartTime];
    NSString *startStr = [str substringFromIndex:11];
    //结束时间
    NSMutableString *str_2 = [NSMutableString stringWithString:model.curriculumEndTime];
    NSString *endStr = [str_2 substringFromIndex:11];
    
    _classTime.text = [NSString stringWithFormat:@"%@ - %@",startStr,endStr];
    _className.text = model.curriculumName;
    _teacherName.text = model.teacherName;
    
    NSArray *rateArr = @[@(model.late),@(model.ask),@(model.leaveEarly),@(model.absent),@(model.rollcall)];
    //NSLog(@"------- 比例 -----------\n %@",rateArr);
    _view.rateArray = rateArr;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
    }
    return self;
}

- (void)creatCell {
    NSArray *labelName = @[@"课程:",@"上课时间:",@"上课老师:"];
    for (int index = 0; index < 3; index++) {
        
        EMIconMarkLabel *label = [[EMIconMarkLabel alloc] initWithFrame:AAdaptionRect(160, 80 * index, kwidth/AAdaptionWidth() - 160, 80) withTitle:labelName[index]];
        label.text = @"hahahaHA哈哈哈哈哈哈哈哈";
        switch (index) {
            case 0:
                _className = label;
                break;
            case 1:
                _classTime = label;
                break;
            default:
                _teacherName = label;
                break;
        }
        [self.contentView addSubview:label];
    }
    
    CGFloat viewY = CGRectGetMaxY(_teacherName.frame) + AAdaption(5);
    CGFloat viewH = 300.0;
    CGFloat radius = (viewH - 40)/2;
    
    _view = [[PieView alloc] initWithFrame:
                                    AAdaptionRect(0, viewY/AAdaptionWidth(), kBaseWidth, viewH)
                                    withRadius:AAdaption(radius)
                                    withColorArray:@[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],]
                                    withRateArray:@[@(1),@(0),@(0.0),@(0),@(0)]
                                    withTouchBlock:^(NSInteger index) {
                                        //回调处理具体的扇形块点击事件
                                        NSLog(@"你点击了第%ld个扇形块",index);
                                        if (self.delegateWithCell) {
                                            [self.delegateWithCell cellWithcell:self];
                                        }
                                        
                                    }];

    [self.contentView addSubview:_view];
}


@end
