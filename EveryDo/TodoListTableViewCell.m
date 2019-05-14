//
//  TodoListTableViewCell.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "TodoListTableViewCell.h"

@interface TodoListTableViewCell ()



@end

@implementation TodoListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)addTodo:(Todo *)todo {
    self.todo = todo;
    self.todoTitleLabel.text = todo.title;
}

@end
