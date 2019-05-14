//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *lowButton;
@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIButton *importantButton;
@property (weak, nonatomic) IBOutlet UIButton *criticalButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic) NSInteger level;

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.level = 2;
    [self.normalButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];


}

#pragma mark IBActions

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.addTodoDelegate addTodoWithTitle:self.titleTextField.text description:self.descriptionTextView.text priority:self.level];
}

- (IBAction)priorityButtonTapped:(UIButton *)sender {
    self.level = sender.tag;
    switch (sender.tag) {
        case 3:
            [self.lowButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self.normalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.importantButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.criticalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            break;
        case 2:
            [self.lowButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.normalButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self.importantButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.criticalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            break;
        case 1:
            [self.lowButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.normalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.importantButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self.criticalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            break;
        case 0:
            [self.lowButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.normalButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.importantButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.criticalButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            break;
        default:
            break;
            
            
    }
    
    
}



@end
