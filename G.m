//
//  G.m
//
//  Created by hustlzp on 15/9/11.
//  Copyright (c) 2015年 hustlzp. All rights reserved.
//

#import "G.h"

@implementation G

+ (G *)sharedInstance
{
    static G *g;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g = [G new];
    });
    
    return g;
}

@end
