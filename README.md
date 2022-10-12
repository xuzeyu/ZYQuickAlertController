# ZYQuickAlertController

## 介绍
快速调用系统弹框，或者调用自定义的弹框

## 如何导入
```
pod 'ZYQuickAlertController'
```

## 如何使用
```objc
#import "ViewController.h"
#import "UIViewController+ZYQuickAlertController.h"

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
}
@end

//如果需要在UIView中调用弹框，可以直接调用ZYQuickAlertController
[ZYQuickAlertController alertWithTitle:@"提示" message:@"我是弹框4" cancelButtonHandler:^{
    NSLog(@"点击了取消按钮");
} presentingViewController:self.vc];

//如果需要调用自定义的其他弹框，则需要AppDelegate中增加以下代码
#import "ZYQuickAlertController.h"
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ZYQuickAlertController setDelegate:self];
    return YES;
}

//此处以SPAlertController为例
#pragma mark - ZYQuickAlertControllerDelegate
- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:title message:message preferredStyle:(SPAlertControllerStyle)preferredStyle];
    if (defaultButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:defaultButtonTitle style:SPAlertActionStyleDefault handler:^(SPAlertAction * _Nonnull action) {
            if (defaultButtonHandler) {
                defaultButtonHandler();
            }
        }]];
    }
    
    if (cancelButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:cancelButtonTitle style:SPAlertActionStyleDefault handler:^(SPAlertAction * _Nonnull action) {
            if (cancelButtonHandler) {
                cancelButtonHandler();
            }
        }]];
    }
    
    if (destructiveButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:destructiveButtonTitle style:SPAlertActionStyleDestructive handler:^(SPAlertAction * _Nonnull action) {
            if (destructiveButtonHandler) {
                destructiveButtonHandler();
            }
        }]];
    }
    
    if (presentingViewController) {
        [presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    if (!message) return;
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:title message:message preferredStyle:SPAlertControllerStyleAlert];
    for (int i = 0; i < actionTitles.count; i++) {
        SPAlertActionStyle style = SPAlertActionStyleDefault;
        if (i < styles.count) {
            style = [styles[i] intValue];
        }
        [alert addAction:[SPAlertAction actionWithTitle:actionTitles[i] style:style handler:^(SPAlertAction * _Nonnull action) {
            if (handler) {
                handler(i);
            }
        }]];
    }
    
    if (presentingViewController) {
        [presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}


```

## 更多
```objc
@interface UIViewController (ZYQuickAlertController)

//AlertWithTitle
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler;

//AlertWithMessage 默认title为"提示"
- (void)alertWithMessage:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithMessage:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler;

//ActionSheet
- (void)actionSheetWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler;
@end
```
