//
//  UIViewRN.h
//  JSCore
//
//  Created by Mao Yuxi on 2017/12/23.
//  Copyright © 2017年 Mao Yuxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class UIViewRN;

@protocol UIViewRNExport <JSExport>

@property (nonatomic, assign) CGRect frame;

+ (UIViewRN*)makeUIViewRNWithX:(double)x y:(double)y width:(double)width height:(double)height;
- (void)addToParentView;

- (NSString *)description;

@end

@interface UIViewRN : UIView<UIViewRNExport>

+ (UIViewRN*)makeUIViewRNWithX:(double)x y:(double)y width:(double)width height:(double)height;
- (void)addToParentView;
- (NSString *)description;

@end
