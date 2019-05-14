//
//  ViewController.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"
#import "TodoListTableViewCell.h"
#import "AddTodoViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,AddTodoDelegate>
@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TodiListCell";
    TodoListTableViewCell *cell = [self.todoListTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TodoListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.titleLabel.text = @"hiiii";
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AddTodoViewController *dvc = segue.destinationViewController;
    dvc.addTodoDelegate = self;

    NSLog(@"segue ????");
}




- (void)addTodoWithTitle:(nonnull NSString *)title description:(nonnull NSString *)description priority:(NSInteger)priorityLevel {
    NSLog(@"calling delegate?");
}


@end
