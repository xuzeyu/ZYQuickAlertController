# ZYQuickAlertController

## 介绍
快速调用系统弹框，或者调用自定义的弹框, 链式调用。

## 如何导入
```
pod 'ZYQuickAlertController'
```

## 如何使用
```objc
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
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
    
    //设置自定义弹框,自定义弹框需要再appdelegate定义delegate方法
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
}

@end

//如果需要调用自定义的其他弹框，则需要AppDelegate中增加以下代码
#import "ZYQuickAlertController.h"
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ZYQuickAlertController setDelegate:self];
    return YES;
}

//此处以SPAlertController为例
#pragma mark - ZYQuickAlertControllerDelegate
- (void)alertWithConfig:(ZYQuickAlertConfig *)config {
    if (!config) return ;
    
    if (!config.presentingViewController) return;
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:config.title message:config.message preferredStyle:config.style];
    __weak typeof(config) weakConfig = config;
    for (int i = 0; i < config.actions.count; i++) {
        ZYQuickAlertAction *zyAction = config.actions[i];
        [alert addAction:[SPAlertAction actionWithTitle:zyAction.title style:zyAction.style handler:^(SPAlertAction * _Nonnull action) {
            if (zyAction.block) {
                zyAction.block(weakConfig);
            }
        }]];
    }
    if (config.messageTextAlignment) alert.textAlignment = config.messageTextAlignment;
    if (config.titleAttributedString) alert.attributedTitle = config.titleAttributedString;
    if (config.messageAttributedString) alert.attributedMessage = config.messageAttributedString;
    alert.titleFont = config.titleFont ? config.titleFont : alert.titleFont;
    alert.titleColor = config.titleColor ? config.titleColor : alert.titleColor;
    alert.messageFont = config.messageFont ? config.messageFont : alert.messageFont;
    alert.messageColor = config.messageColor ? config.messageColor : alert.messageColor;
    if (config.minDistanceToEdges > 0) alert.minDistanceToEdges = config.minDistanceToEdges;
    
    for (int i = 0; i < config.textFieldBlocks.count; i++) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            [config.textFields addObject:textField];
            config.textFieldBlocks[i](textField);
        }];
    }
    
    if (config.presentingViewController) {
        [config.presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
//        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}


```

## 更多
```objc
@interface UIViewController (ZYQuickAlertController)
- (ZYQuickAlertConfig *)zyAlert; ///<原生弹框
- (ZYQuickAlertConfig *)zyAlertCustom;///<自定义弹框
+ (ZYQuickAlertConfig *)zyAlert; ///<原生弹框
+ (ZYQuickAlertConfig *)zyAlertCustom;///<自定义弹框
@end

```
