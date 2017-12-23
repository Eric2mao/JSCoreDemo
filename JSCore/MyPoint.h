//
//  MyPoint.h
//  JSCore
//
//  Created by Mao Yuxi on 2017/12/23.
//  Copyright © 2017年 Mao Yuxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class MyPoint;

@protocol MyPointExport <JSExport>

@property double x;
@property double y;

- (NSString *)description;
+ (MyPoint *)makePointWithX:(double)x y:(double)y;

@end

@interface MyPoint : NSObject <MyPointExport>

@property double x;
@property double y;

- (instancetype)initWithX:(double)x y:(double)y;
- (NSString *)description;
+ (MyPoint *)makePointWithX:(double)x y:(double)y;

@end
