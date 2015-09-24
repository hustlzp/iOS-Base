//
//  Seed.h
//
//  Created by hustlzp on 15/9/11.
//  Copyright (c) 2015年 hustlzp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>

@interface Seed : NSObject

+ (void)seedData;
+ (void)truncateAllData;

@end
