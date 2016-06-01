//
//  TestWeakStrong.m
//  TestWeakStrong
//
//  Created by Bill liu on 16/5/5.
//  Copyright © 2016年 heshidai. All rights reserved.
//

#import "TestWeakStrong.h"



@interface TestWeakStrong()
@property (nonatomic,strong) NSString * orginal3;
@property (nonatomic,weak) NSString * weakOfOrginal3;

@end


@implementation TestWeakStrong

-(instancetype)init{
    self = [super init];
    
    if (self) {        
        self.orginal3 = @"orginal3";
        self.weakOfOrginal3 = _orginal3;
        self.orginal3 = nil;
        NSLog(@"原数据3:%@\n\n",self.weakOfOrginal3);
        
        NSString * orginal = @"orginal";
        NSString * orginal2 = @"orginal2";
        __weak NSString * weakPointO = orginal;
        __weak NSString * weakPointPointO = weakPointO;
        
        NSLog(@"原数据:%@ %p",orginal,&orginal);
        NSLog(@"原数据2:%@ %p",orginal2,&orginal2);
        NSLog(@"弱引用指向原数据:%@ %p",weakPointO,&weakPointO);
        NSLog(@"弱引用指向指向原数据:%@ %p\n\n",weakPointPointO,&weakPointPointO);
        
        
        NSLog(@"更新值后\n\n");
        orginal = nil;
        NSLog(@"原数据:%@ %p",orginal,&orginal);
        NSLog(@"原数据2:%@ %p",orginal2,&orginal2);
        NSLog(@"弱引用指向原数据:%@ %p",weakPointO,&weakPointO);
        NSLog(@"弱引用指向指向原数据:%@ %p\n\n",weakPointPointO,&weakPointPointO);
        
        
        __weak typeof(self) weakOfSelf = self;
        NSLog(@"weak of self:%@",weakOfSelf);
        
    }
    
    return self;
}


@end
