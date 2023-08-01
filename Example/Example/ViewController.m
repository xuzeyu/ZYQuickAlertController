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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self test];
    });
}

- (void)test {
//    self.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultActionHandler(^(ZYQuickAlertConfig * _Nonnull config) {
//        NSLog(@"点击了确定按钮");
//    }).alert();
    
//    self.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
//        NSLog(@"点击了确定按钮");
//    }).addCancelAction(@"取消按钮", ^{
//        NSLog(@"点击了取消按钮");
//    }).alert();
    self.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮",^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮---%@", config.title);
    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了取消按钮");
    }).addTextFieldWithConfigurationHandler(^(UITextField * _Nonnull textField) {
        textField.text = @"1123";
    }).alert();
    
//    [ZYQuickAlertController alertWithConfig:ZYQuickAlertConfig.new.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
//        NSLog(@"点击了确定按钮");
//    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
//        NSLog(@"点击了取消按钮");
//    }).setPresentingViewController(self)];
    
}
@end
