//
//  AddTodoViewController.h
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddTodoDelegate <NSObject>

-(void)addTodoWithTitle:(NSString*) title description: (NSString*) description priority: (NSInteger) priorityLevel;

@end

@interface AddTodoViewController : ViewController

@property (weak, nonatomic) id<AddTodoDelegate> addTodoDelegate;

@end

NS_ASSUME_NONNULL_END
