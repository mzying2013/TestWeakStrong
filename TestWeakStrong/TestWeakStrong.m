//
//  TestWeakStrong.m
//  TestWeakStrong
//
//  Created by Bill liu on 16/5/5.
//  Copyright © 2016年 heshidai. All rights reserved.
//

#import "TestWeakStrong.h"

//引用博客地址：http://honglu.me/2015/01/06/weak%E4%B8%8Eblock%E5%8C%BA%E5%88%AB/
#define TLog(name,Obj) {NSLog(@"变量内存地址：%p, 变量值：%p, 指向对象值：%@, --> %@",&Obj,Obj,Obj,name);}


@interface TestWeakStrong()
@property (nonatomic,strong) NSString * orginal3;
@property (nonatomic,weak) NSString * weakOfOrginal3;

@end


@implementation TestWeakStrong

-(instancetype)init{
    self = [super init];
    
    if (self) {
        NSLog(@"========start==================");
        
        //不管weak还是strong，变量内存地址都不一样。变量值才一样
        NSObject *oobj = [NSObject new];
        __weak NSObject * weakObj = oobj;
        NSObject * strongObj = oobj;
        TLog(@"oobj", oobj);
        TLog(@"weakobj", weakObj);
        TLog(@"strongObj", strongObj);
        //即使oobj置为空，但是变量值任然后strongObj指向，所以weakObj不会自动释放
        oobj = nil;
        NSLog(@"oobj set nil");
        TLog(@"oobj", oobj);
        TLog(@"weakobj", weakObj);
        TLog(@"strongObj", strongObj);
        strongObj = nil;
        NSLog(@"strongObj set nil");
        TLog(@"oobj", oobj);
        TLog(@"weakobj", weakObj);
        TLog(@"strongObj", strongObj);
        
        NSLog(@"========end====================");
        
        
        
        //这个主要是因为编译器本身对 NSString 是有优化的
        //创建的 string 对象有可能是静态存储区永不释放的
        //为了避免使用 NSString 引起一些问题，还是创建一个 NSObject 对象比较合适。
        /*
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
       */
        
        
        __weak typeof(self) weakOfSelf = self;
        NSLog(@"weak of self:%@",weakOfSelf);
    }
    
    return self;
}


@end
