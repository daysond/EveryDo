//
//  Todo.h
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property (nonatomic) NSDate* deadline;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* todoDescription;
@property (nonatomic) NSInteger priorityLevel;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle: (NSString*) title description:(NSString*) description priorityLevel: (NSInteger)level;

@end

NS_ASSUME_NONNULL_END
