//
//  MyPoint.m
//  JSCore
//
//  Created by Mao Yuxi on 2017/12/23.
//  Copyright © 2017年 Mao Yuxi. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

- (instancetype)initWithX:(double)x y:(double)y
{
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@, %@)", @(self.x), @(self.y)];
}

+ (MyPoint *)makePointWithX:(double)x y:(double)y
{
    MyPoint *point = [[MyPoint alloc] init];
    point.x = x;
    point.y = y;
    
    return point;
}

@end
