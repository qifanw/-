//
//  ViewController.m
//  消息转发机制
//
//  Created by wqf on 2018/4/3.
//  Copyright © 2018年 wqf. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person * p = [[Person alloc] init];
    [p run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
