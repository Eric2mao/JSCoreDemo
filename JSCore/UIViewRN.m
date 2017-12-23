//
//  UIViewRN.m
//  JSCore
//
//  Created by Mao Yuxi on 2017/12/23.
//  Copyright © 2017年 Mao Yuxi. All rights reserved.
//

#import "UIViewRN.h"

@implementation UIViewRN

+ (UIViewRN*)makeUIViewRNWithX:(double)x y:(double)y width:(double)width height:(double)height;
{
    UIViewRN *view = [[UIViewRN alloc] initWithFrame:CGRectMake(x, y, width, height)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (void)addToParentView
{
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    [controller.view addSubview:self];
}

- (NSString *)description
{
    return @"UIViewRN";
}

@end
