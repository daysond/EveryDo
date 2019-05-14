//
//  TodoListTableViewCell.h
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN



@interface TodoListTableViewCell : UITableViewCell

@property (nonatomic) Todo* todo;
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (nonatomic) NSIndexPath *indexPath;


-(void)addTodo:(Todo*) todo;

@end

NS_ASSUME_NONNULL_END
