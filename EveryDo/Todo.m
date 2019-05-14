//
//  Todo.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle: (NSString*) title description:(NSString*) description priorityLevel:(NSInteger)level
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityLevel = level;
        _deadline = [NSDate new];
    }
    return self;
}

@end
