//
//  PieView.m
//  PieDemo
//
//  Created by zhengbing on 10/01/2017.
//  Copyright © 2017 zhengbing. All rights reserved.
//

#import "PieView.h"

//把角度转换为弧度的计算公式
#define PI 3.14159265358979323846
static inline float radians(double degrees) { return degrees * PI / 180; }

@interface PieView()
{
    CGContextRef _context;

    CGPoint rPoint; //圆心
    CGFloat radius; //半径
    NSArray <UIColor *> *colorArray; //颜色
}
@end
@implementation PieView

//在init 的时候提取参数？两个数组参数?颜色&&比例
-(instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)r withColorArray:(NSArray *)colorArr withRateArray:(NSArray *)rateArr withTouchBlock:(TouchBlock)block{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];

        if (block) {
            self.touchBlock = block;
        }
        //圆心
        rPoint.x = frame.size.width * 3/5;
        rPoint.y = frame.size.height / 2;
        //半径
        radius = r;
        //颜色
        colorArray = colorArr;
        //比例
        _rateArray = rateArr;
        
        [self createTitle];

    }
    return self;
}

- (void)createTitle {
    
    NSArray *colorName = @[@"迟到",@"请假",@"早退",@"旷课",@"正常"];
    for (int i = 0; i < colorArray.count; i++) {
        
        CGFloat HW = 40;
        UIView *view = [[UIView alloc] initWithFrame:AAdaptionRect(HW, 30+50*i, HW, HW)];
        view.backgroundColor = colorArray[i];
        [self addSubview:view];
        
        UILabel *label = [[UILabel alloc] initWithFrame:AAdaptionRect(HW * 2  + 10, 30+50*i, HW*2, HW)];
        label.text = colorName[i];
        label.font = AAFont(24);
        [self addSubview:label];
    }
    
}

#pragma     mark 绘制扇形图
-(void)drawRect:(CGRect)rect{
    //初始化（获取绘图上下文）
    _context = UIGraphicsGetCurrentContext();

    double start = 0;
    for (int i = 0; i< colorArray.count; i++) {
        if (i>0) {
            start += [_rateArray[i-1] floatValue]*360;
        }
        [self paintpie:_context start:start capacity:[_rateArray[i] floatValue]*360 pointx:rPoint.x pointy:rPoint.y piecolor:colorArray[i]];
    }
}

-(void)paintpie:(CGContextRef)ctx
          start:(double)pieStart
       capacity:(double)pieCapacity
         pointx:(double)x
         pointy:(double)y
       piecolor:(UIColor *)color{
    //起始角度，0-360
    double snapshot_start = pieStart;
    //结束角度
    double snapshot_finish = pieStart+pieCapacity;
    //设置扇形填充色
    CGContextSetFillColor(ctx, CGColorGetComponents( [color CGColor]));
    //设置圆心
    CGContextMoveToPoint(ctx, x, y);
    //以150为半径围绕圆心画指定角度扇形，0表示逆时针
    CGContextAddArc(ctx, x, y, radius,  radians(snapshot_start), radians(snapshot_finish), 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

#pragma mark 点击区域事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if ((fabs(point.x - rPoint.x) <= radius) && ((fabs(point.y - rPoint.y) <= radius))) {
        //在圆内
        CGPoint pA = CGPointMake(rPoint.x + radius, rPoint.y);

        CGFloat angle = [self getAnglesWithThreePoint:pA pointB:rPoint pointC:point];

        //角度比例
        CGFloat rate = angle/(2*PI);
        CGFloat end = 1;

        for (NSInteger i = _rateArray.count-1; i >= 0; i--) {
            end -= [_rateArray[i] floatValue];
            if (rate > end) {
                self.touchBlock(i);
                return;
            }
        }
    }
}
#pragma mark 计算点击点的角度
// pointA 为起点，pointB 为圆心，pointC 为计算点
- (CGFloat)getAnglesWithThreePoint:(CGPoint)pointA pointB:(CGPoint)pointB pointC:(CGPoint)pointC {

    CGFloat x1 = pointA.x - pointB.x;
    CGFloat y1 = pointA.y - pointB.y;
    CGFloat x2 = pointC.x - pointB.x;
    CGFloat y2 = pointC.y - pointB.y;
    CGFloat x = x1 * x2 + y1 * y2;
    CGFloat y = x1 * y2 - x2 * y1;
    CGFloat angle = acos(x/sqrt(x*x+y*y));

    if (pointC.y < pointB.y) {
        angle = 2*PI - angle;
    }
    return angle;
}

@end
