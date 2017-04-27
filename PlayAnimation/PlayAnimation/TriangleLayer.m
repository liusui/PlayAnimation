//
//  TriangleLayer.m
//  PlayAnimation
//
//  Created by Liusui on 2017/4/26.
//  Copyright © 2017年 liusui. All rights reserved.
//

#import "TriangleLayer.h"
#import <UIKit/UIKit.h>

@interface TriangleLayer ()
@property (nonatomic, strong) UIBezierPath *anglePath;

@end

@implementation TriangleLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strokeColor = [UIColor greenColor].CGColor;
        self.path = self.anglePath.CGPath;
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
        self.lineWidth = 6;
    }
    return self;
}

- (UIBezierPath *)anglePath {
    if (!_anglePath) {
        _anglePath = [[UIBezierPath alloc] init];
        [_anglePath moveToPoint:CGPointMake(45, 90)];
        [_anglePath addLineToPoint:CGPointMake(90, 60)];
        [_anglePath addLineToPoint:CGPointMake(45, 30)];
        [_anglePath closePath];
    }
    return _anglePath;
}

- (void)strokenAnimaton {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.duration = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:nil];
}

@end
