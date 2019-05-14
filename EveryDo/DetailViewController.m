//
//  DetailViewController.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-14.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextfield;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextfield.text = self.todo.title;
    self.descriptionTextView.text = self.todo.todoDescription;
    self.datePicker.date = self.todo.deadline;

}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    self.todo.deadline = sender.date;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    self.todo.title = self.titleTextfield.text;
    self.todo.todoDescription = self.descriptionTextView.text;
    [self.delegate updateTodo:self.todo atIndexes:self.indexPath];

}




@end
