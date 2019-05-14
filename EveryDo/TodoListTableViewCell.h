//
//  TodoListTableViewCell.h
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface TodoListTableViewCell : UITableViewCell

@property (nonatomic) NSString* todoDescription;
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;


-(void)setTodoTitle:(NSString*) todoTitle todoDescription: (NSString*) todoDescription;

@end

NS_ASSUME_NONNULL_END
