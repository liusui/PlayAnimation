//
//  PlayView.m
//  PlayAnimation
//
//  Created by Liusui on 2017/4/26.
//  Copyright © 2017年 liusui. All rights reserved.
//

#import "PlayView.h"
#import "CircleLayer.h"
#import "TriangleLayer.h"

@interface PlayView ()
@property (nonatomic, strong) CircleLayer *circleLayer;
@property (nonatomic, strong) TriangleLayer *anglePath;

@end

@implementation PlayView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    [self addCircleLayer];
    [self addAngleLayer];
}

- (void)addCircleLayer {
    CAShapeLayer *backLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *backPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 100)];
    backLayer.strokeColor = [UIColor brownColor].CGColor;
    backLayer.path = backPath.CGPath;
    backLayer.lineWidth = 4;
    [self.layer addSublayer:backLayer];
    
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer animation];
    [self.anglePath strokenAnimaton];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addLineLayer];
    });
}

- (void)addAngleLayer {
    [self.layer addSublayer:self.anglePath];
}

- (void)addLineLayer {
    CAShapeLayer *leftLineLayer = [[CAShapeLayer alloc] init];
    leftLineLayer.lineCap = kCALineCapRound;
    leftLineLayer.lineJoin = kCALineJoinRound;
    leftLineLayer.strokeColor = [UIColor greenColor].CGColor;
    UIBezierPath *leftPath = [[UIBezierPath alloc] init];
    [leftPath moveToPoint:CGPointMake(45, 30)];
    [leftPath addLineToPoint:CGPointMake(45, 90)];
    [leftPath closePath];
    leftLineLayer.lineWidth = 6;
    leftLineLayer.path = leftPath.CGPath;
    [self.layer addSublayer:leftLineLayer];
    [leftLineLayer addAnimation:[self lineAnimationFrom:@0.0 to:@1.0] forKey:nil];
    
    CAShapeLayer *rightLayer = [[CAShapeLayer alloc] init];
    rightLayer.lineCap = kCALineCapRound;
    rightLayer.lineJoin = kCALineJoinRound;
    rightLayer.strokeColor = [UIColor greenColor].CGColor;
    UIBezierPath *rightPath = [[UIBezierPath alloc] init];
    [rightPath moveToPoint:CGPointMake(70, 90)];
    [rightPath addLineToPoint:CGPointMake(70, 30)];
    [rightPath closePath];
    rightLayer.path = rightPath.CGPath;
    rightLayer.lineWidth = 6;
    [self.layer addSublayer:rightLayer];
    [rightLayer addAnimation:[self lineAnimationFrom:@0.0 to:@1.0] forKey:nil];
}

- (CABasicAnimation *)lineAnimationFrom:(id)from to:(id)to{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}

- (CircleLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [[CircleLayer alloc] init];
    }
    return _circleLayer;
}

- (TriangleLayer *)anglePath {
    if (!_anglePath) {
        _anglePath = [[TriangleLayer alloc] init];
    }
    return _anglePath;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}

@end
