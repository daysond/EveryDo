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


@interface ViewController () <UITableViewDataSource,UITableViewDelegate,AddTodoDelegate,UpdateTodoDelegate>
@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;
@property (nonatomic) NSMutableArray <NSMutableArray<Todo*>*> *todoList;
@property (nonatomic) NSArray <NSString*> *setionTitles;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.todoListTableView setEditing:NO];
    
    self.setionTitles = @[@"Critical", @"Important", @"Normal",@"Low",@"Completed"];
    
    [self setupTodolist];

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

-(void)setupTodolist {
    
    self.todoList = [[NSMutableArray alloc]initWithObjects:[NSMutableArray new],[NSMutableArray new],[NSMutableArray new],[NSMutableArray new],[NSMutableArray new], nil];
    Todo *todo = [[Todo alloc]initWithTitle:@"first" description:@"first thing do to" priorityLevel:0];
    [self addTodo:todo WithPriority:todo.priorityLevel];
    todo = [[Todo alloc]initWithTitle:@"second" description:@"second thing do to" priorityLevel:1];
    [self addTodo:todo WithPriority:todo.priorityLevel];
    todo = [[Todo alloc]initWithTitle:@"third" description:@"third thing do to" priorityLevel:2];
    [self addTodo:todo WithPriority:todo.priorityLevel];
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
    Todo *todo = self.todoList[indexPath.section][indexPath.row];
    cell.indexPath = indexPath;
    [cell addTodo:todo];
    
    return cell;
}

#pragma mark move row

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender {
    
    
    if (self.todoListTableView.isEditing == NO){
        [self.editButton setTitle:@"Done"];
        [self.todoListTableView setEditing:YES];
    } else {
        [self.todoListTableView setEditing:NO];
        self.editButton.title= @"Edit"; }
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    Todo* todo = self.todoList[sourceIndexPath.section][sourceIndexPath.row];
    [self.todoList[sourceIndexPath.section] removeObject:todo];
    todo.priorityLevel = destinationIndexPath.section;
    [self.todoList[destinationIndexPath.section] insertObject:todo atIndex:destinationIndexPath.row];
    
}

#pragma mark row actions

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.todoListTableView reloadData];
        [self.todoList[indexPath.section] removeObject: self.todoList[indexPath.section][indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    delete.backgroundColor = [UIColor redColor];
    
    if (indexPath.section < 4) {

        UITableViewRowAction *mark = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Done" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            self.todoList[indexPath.section][indexPath.row].isCompleted = YES;
            [self.todoList[4] addObject:self.todoList[indexPath.section][indexPath.row]];
            [self.todoListTableView reloadData];
            [self.todoList[indexPath.section] removeObject: self.todoList[indexPath.section][indexPath.row]];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        }];
        mark.backgroundColor = [UIColor blueColor];
        return @[mark,delete];
    } else {
        
        UITableViewRowAction *mark = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Undone" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            self.todoList[indexPath.section][indexPath.row].isCompleted = NO;
            [self addTodo:self.todoList[indexPath.section][indexPath.row] WithPriority:self.todoList[indexPath.section][indexPath.row].priorityLevel];
             [self.todoListTableView reloadData];
            [self.todoList[4] removeObject:self.todoList[indexPath.section][indexPath.row]];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
        mark.backgroundColor = [UIColor blueColor];
        return @[mark,delete];
    }
}


#pragma mark segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"addTodoSegue"]) {
        AddTodoViewController *dvc = segue.destinationViewController;
        dvc.addTodoDelegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"todoDetail"]) {
        DetailViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
        TodoListTableViewCell* cell = sender;
        dvc.indexPath = cell.indexPath;
        dvc.todo = cell.todo;
        
    }

}

#pragma mark delegate

- (void)addTodoWithTitle:(nonnull NSString *)title description:(nonnull NSString *)description priority:(NSInteger)priorityLevel {
    Todo *todo = [[Todo alloc]initWithTitle:title description:description priorityLevel:priorityLevel];
    [self addTodo:todo WithPriority:todo.priorityLevel];
}

-(void)updateTodo: (Todo*) todo atIndexes: (NSIndexPath*) indexPath {
    self.todoList[indexPath.section][indexPath.row] = todo;
}

@end
