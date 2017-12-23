//
//  ViewController.m
//  JSCore
//
//  Created by Mao Yuxi on 2017/12/22.
//  Copyright © 2017年 Mao Yuxi. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "MyPoint.h"
#import "UIViewRN.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JSContext *context = [[JSContext alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"javascript" ofType:@"js"];
    NSString *jsContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", jsContent);
    
    //装载js
    JSValue *loadJS = [context evaluateScript:jsContent];
    NSLog(@"result is : %@", @([loadJS toInt32]));
    
    JSValue *factorial = context[@"factorial"];
    
    JSValue *result = [factorial callWithArguments:@[@(5)]];
    NSLog(@"result is : %@", @([result toInt32]));
    
    //js -> Native JSExport  Native调用js方法
    MyPoint *point1 = [[MyPoint alloc] initWithX:0.0 y:0.0];
    MyPoint *point2 = [[MyPoint alloc] initWithX:1.0 y:1.0];
    
    JSValue *function = context[@"euclideanDistance"];
    JSValue *distanceResult = [function callWithArguments:@[point1, point2]];
    NSLog(@"euclideanDistance is %f", [distanceResult toDouble]);
    
    //计算中点，JS创建并返回OC对象
    context[@"MyPoint"] = [MyPoint class];
    
    JSValue *midPointFunction = context[@"midPoint"];
    JSValue *midPointValue = [midPointFunction callWithArguments:@[point1, point2]];
    MyPoint *midPoint = [midPointValue toObject];
    
    NSLog(@"%@", midPoint);
    
    //RN Demo
    //把OC类生成对应的js类
    context[@"UIViewRN"] = [UIViewRN class];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JSValue *createViewFunction = context[@"createView"];
        JSValue *viewJS = [createViewFunction callWithArguments:@[@(200), @(200), @(30), @(30)]];
        UIViewRN *viewOC = [viewJS toObject];
        NSLog(@"%@", viewOC);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
