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
#import "DetailViewController.h"
#import "Todo.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,AddTodoDelegate>
@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;
@property (nonatomic) NSMutableArray <NSMutableArray<Todo*>*> *todoList;
@property (nonatomic) NSArray <NSString*> *setionTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.todoList = [[NSMutableArray alloc]initWithObjects:[NSMutableArray new],[NSMutableArray new],[NSMutableArray new],[NSMutableArray new],[NSMutableArray new], nil];
    self.setionTitles = @[@"Critical", @"Important", @"Normal",@"Low",@"Completed"];
    
    Todo *todo = [[Todo alloc]initWithTitle:@"first" description:@"first thing do to" priorityLevel:0];
    [self addTodo:todo WithPriority:todo.priorityLevel];
    todo = [[Todo alloc]initWithTitle:@"second" description:@"second thing do to" priorityLevel:1];
    [self addTodo:todo WithPriority:todo.priorityLevel];
    todo = [[Todo alloc]initWithTitle:@"third" description:@"third thing do to" priorityLevel:2];
    [self addTodo:todo WithPriority:todo.priorityLevel];

    NSLog(@"hii %@",self.todoList);
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    [self.todoListTableView reloadData];
}

#pragma mark helper

-(void)addTodo: (Todo*) todo WithPriority: (NSInteger) level {
    switch (level) {
        case 0:
            [self.todoList[0] addObject:todo];
            break;
        case 1:
            [self.todoList[1] addObject:todo];
            break;
        case 2:
            [self.todoList[2] addObject:todo];
            break;
        case 3:
            [self.todoList[3] addObject:todo];
            break;
        default:
            break;
    }
}

#pragma mark table view set up

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.todoList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList[section].count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.setionTitles[section];
}

#pragma mark cell set up

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *cellIdentifier = @"TodiListCell";
    TodoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TodoListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString* todoTitle = self.todoList[indexPath.section][indexPath.row].title;
    NSString* todoDescription = self.todoList[indexPath.section][indexPath.row].todoDescription;
    [cell setTodoTitle:todoTitle todoDescription:todoDescription];
    
    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section < 4) {

        UITableViewRowAction *mark = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Done" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            self.todoList[indexPath.section][indexPath.row].isCompleted = YES;
            [self.todoList[4] addObject:self.todoList[indexPath.section][indexPath.row]];
            [self.todoListTableView reloadData];
            [self.todoList[indexPath.section] removeObject: self.todoList[indexPath.section][indexPath.row]];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        }];
        mark.backgroundColor = [UIColor blueColor];
        
        
        return @[mark];
    } else {
        
        UITableViewRowAction *mark = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Undo" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            self.todoList[indexPath.section][indexPath.row].isCompleted = NO;
            [self addTodo:self.todoList[indexPath.section][indexPath.row] WithPriority:self.todoList[indexPath.section][indexPath.row].priorityLevel];
             [self.todoListTableView reloadData];
            [self.todoList[4] removeObject:self.todoList[indexPath.section][indexPath.row]];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

            
            
        }];
        mark.backgroundColor = [UIColor blueColor];
        
        
        return @[mark];
        
    }
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"addTodoSegue"]) {
        AddTodoViewController *dvc = [(UINavigationController*)segue.destinationViewController topViewController];
        dvc.addTodoDelegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"todoDetail"]) {
        DetailViewController *dvc = segue.destinationViewController;
        TodoListTableViewCell* cell = sender;
        dvc.todoDescription = cell.todoDescription;
        
    }

}

#pragma mark delegate

- (void)addTodoWithTitle:(nonnull NSString *)title description:(nonnull NSString *)description priority:(NSInteger)priorityLevel {
    Todo *todo = [[Todo alloc]initWithTitle:title description:description priorityLevel:priorityLevel];
    [self addTodo:todo WithPriority:todo.priorityLevel];
    NSLog(@"todolist: %@",self.todoList);
}


@end
