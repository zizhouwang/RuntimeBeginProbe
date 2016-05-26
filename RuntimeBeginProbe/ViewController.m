//
//  ViewController.m
//  RuntimeBeginProbe
//
//  Created by wzzyinqiang on 16/5/25.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Runtime.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "AppDelegate.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc] init];
    
    NSLog(@"%f",label.font.pointSize);
    
    
    NSObject * runtime_object = [[NSObject alloc] init];
    
    runtime_object.tag_str = @"runtime";
    
    NSLog(@"%@",runtime_object.tag_str);
    
    
    unsigned int class_member_variable_number = 0;
    
    Ivar * ivars = class_copyIvarList([AppDelegate class], &class_member_variable_number);
    
    for (NSInteger i = 0; i < class_member_variable_number; i++) {
        Ivar ivar = ivars[i];
        
        NSLog(@"%s",ivar_getName(ivar));
        
        NSLog(@"%s",ivar_getTypeEncoding(ivar));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
