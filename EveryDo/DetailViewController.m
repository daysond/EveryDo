//
//  DetailViewController.m
//  EveryDo
//
//  Created by Dayson Dong on 2019-05-14.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.todoDescription;
    // Do any additional setup after loading the view.
}



@end
