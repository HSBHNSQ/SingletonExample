//
//  Singleton.m
//  
//
//  Created by 何少博 on 17/4/1.
//  Copyright © 2017年 shaobo.He. All rights reserved.
//

#import "Singleton.h"




@implementation Singleton




#if __has_feature(objc_arc) // 是ARC

static Singleton * _instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [super allocWithZone:zone];
        });
    }
    return _instance;
}

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

+ (instancetype)shareInstance
{
    return [[self alloc] init];
}
+ (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

+ (instancetype)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

#else // MRC

static Singleton * _instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
//            _instance = [super allocWithZone:zone];
            _instance = [NSAllocateObject([self class], 0, NULL ) init];
        });
    }
    return _instance;
}

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

+ (instancetype)shareInstance
{
    return [[self alloc] init];
}

- (oneway void)release
{
    
}

- (instancetype)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return 1;
}
+ (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

+ (instancetype)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

#endif




@end
