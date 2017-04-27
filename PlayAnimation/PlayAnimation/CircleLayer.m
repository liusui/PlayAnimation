//
//  CircleLayer.m
//  PlayAnimation
//
//  Created by Liusui on 2017/4/26.
//  Copyright © 2017年 liusui. All rights reserved.
//

#import "CircleLayer.h"
#import <UIKit/UIKit.h>

@interface CircleLayer ()
@property (nonatomic, strong) UIBezierPath *circlePath;

@end

@implementation CircleLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strokeColor = [UIColor greenColor].CGColor;
        self.path = self.circlePath.CGPath;
        self.lineWidth = 6;
    }
    return self;
}

- (UIBezierPath *)circlePath {
    if (!_circlePath) {
        _circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(9, 9, 102, 102)];
    }
    return _circlePath;
}

- (void)animation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @1.0;
    animation.toValue = @0.0;
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self addAnimation:animation forKey:nil];
}

@end
