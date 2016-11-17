//
//  UIView+HitExtension.m
//  ResponseLink
//
//  Created by 张东 on 16/11/17.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "UIView+HitExtension.h"
#import <objc/runtime.h>
@implementation UIView (HitExtension)
static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";

-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    NSLog(@"%@__%d", self, CGRectContainsPoint(hitFrame, point));
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
