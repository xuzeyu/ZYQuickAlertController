//
//  ViewController.m
//  Example
//
//  Created by XUZY on 2022/8/26.
//

#import "ViewController.h"
#import "UIViewController+ZYQuickAlertController.h"
#import "ZYQuickAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self alertWithTitle:@"提示" message:@"我是弹框1" defaultButtonHandler:^{
        NSLog(@"点击了确定按钮");
    }];
    
    [self alertWithTitle:@"提示" message:@"我是弹框2" cancelButtonTitle:@"取消按钮" cancelButtonHandler:^{
        NSLog(@"点击了取消按钮");
    } destructiveButtonTitle:@"确定按钮" destructiveButtonHandler:^{
        NSLog(@"点击了确定按钮");
    }];
    
    [self alertWithTitle:@"提示" message:@"我是弹框3" actionTitles:@[@"确定", @"取消"] styles:@[@(UIAlertActionStyleDefault), @(UIAlertActionStyleCancel)] handler:^(int index) {
        if (index == 0) {
            NSLog(@"点击了确定按钮");
        }else {
            NSLog(@"点击了取消按钮");
        }
    }];
    
    [ZYQuickAlertController alertWithTitle:@"提示" message:@"我是弹框4" cancelButtonHandler:^{
            NSLog(@"点击了取消按钮");
    } presentingViewController:self];
}
@end
