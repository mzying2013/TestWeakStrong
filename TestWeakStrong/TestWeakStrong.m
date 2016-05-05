//
//  TestWeakStrong.m
//  TestWeakStrong
//
//  Created by Bill liu on 16/5/5.
//  Copyright © 2016年 heshidai. All rights reserved.
//

#import "TestWeakStrong.h"

@implementation TestWeakStrong

-(instancetype)init{
    self = [super init];
    
    if (self) {
        NSString * orginal = @"orginal";
        NSString * pointO = @"orginal2";
        __weak NSString * weakPointO = orginal;
        __weak NSString * weakPointPointO = pointO;
        
        NSLog(@"原数据:%@ %p",orginal,&orginal);
        NSLog(@"指向原数据:%@ %p",pointO,&pointO);
        NSLog(@"弱引用指向原数据:%@ %p",weakPointO,&weakPointO);
        NSLog(@"弱引用指向指向原数据:%@ %p\n\n",weakPointPointO,&weakPointPointO);
        
        
        NSLog(@"更新值后\n\n");
        orginal = nil;
        NSLog(@"原数据:%@ %p",orginal,&orginal);
        NSLog(@"指向原数据:%@ %p",pointO,&pointO);
        NSLog(@"弱引用指向原数据:%@ %p",weakPointO,&weakPointO);
        NSLog(@"弱引用指向指向原数据:%@ %p\n\n",weakPointPointO,&weakPointPointO);
        
    }
    
    return self;
}


@end
