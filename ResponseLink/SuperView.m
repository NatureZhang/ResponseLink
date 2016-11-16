//
//  SuperView.m
//  ResponseLink
//
//  Created by 张东 on 16/11/16.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "SuperView.h"

@implementation SuperView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                if ([subView isKindOfClass:[UIButton class]]) {
                    view = subView;
                }
            }
        }
    }
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIEdgeInsets hitTestEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}
@end
