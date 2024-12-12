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
    //显示提示标题，显示确定按钮
    self.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultActionHandler(^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮");
    }).alert();
    
    //显示提示标题，显示默认确定按钮，删除按钮，和默认取消按钮
    self.zyAlert.sDefTitle.sMessage(@"我是弹框1").addDefaultActionHandler(^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮");
    }).addDestructiveAction(@"删除按钮", ^(ZYQuickAlertConfig * _Nonnull config){
        NSLog(@"点击了删除按钮");
    }).addCancelActionHandler(nil).alert();
    
    //显示提示标题，显示自定义文字确定按钮和自定义文字取消按钮
    self.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮");
    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config){
        NSLog(@"点击了取消按钮");
    }).alert();
    
    //设置自定义弹框
    self.zyAlertCustom.sDefTitle.sMessage(@"我是弹框1").addDefaultAction(@"确定按钮",^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮---%@", config.title);
    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了取消按钮");
    }).addTextFieldWithConfigurationHandler(^(UITextField * _Nonnull textField) {
        textField.text = @"1123";
    }).sMessageTextAlignment(NSTextAlignmentLeft).alert();
    
    //如果需要在UIView中调用弹框，可以直接调用UIViewController
    UIViewController.zyAlert.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮");
    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config){
        NSLog(@"点击了取消按钮");
    }).alert();
    
    //如果需要在UIView中调用弹框，也可以直接调用ZYQuickAlertController
    [ZYQuickAlertController alertWithConfig:ZYQuickAlertConfig.new.sTitle(@"提示").sMessage(@"我是弹框1").addDefaultAction(@"确定按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了确定按钮");
    }).addCancelAction(@"取消按钮", ^(ZYQuickAlertConfig * _Nonnull config) {
        NSLog(@"点击了取消按钮");
    }).sPresentingViewController(self)];
}

@end
