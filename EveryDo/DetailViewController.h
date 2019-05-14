//
//  DetailViewController.h
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-14.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN
@protocol UpdateTodoDelegate <NSObject>

-(void)updateTodo: (Todo*) todo atIndexes: (NSIndexPath*) indexPath;

@end

@interface DetailViewController : UIViewController

@property (nonatomic) Todo* todo;
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic, weak) id<UpdateTodoDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
