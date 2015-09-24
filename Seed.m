//
//  Seed.m
//
//  Created by hustlzp on 15/9/11.
//  Copyright (c) 2015年 hustlzp. All rights reserved.
//

#import "Seed.h"
#import "AFNetworking.h"

static const NSString *CDN = @"";

@implementation Seed

+ (void)seedData {
}

// Truncate all data
+ (void)truncateAllData {
    // TODO
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
