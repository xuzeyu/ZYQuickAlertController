//
//  ZYQuickAlertController.m
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import "ZYQuickAlertController.h"

@interface ZYQuickAlertController() <ZYQuickAlertControllerDelegate>
@property (nonatomic, weak) NSObject <ZYQuickAlertControllerDelegate> *delegate;
@end

@implementation ZYQuickAlertController

+ (instancetype)shareInstance {
    static ZYQuickAlertController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZYQuickAlertController alloc] init];
        instance.delegate = instance;
    });
    return instance;
}

+ (void)setDelegate:(NSObject <ZYQuickAlertControllerDelegate> *)delegate {
    [ZYQuickAlertController shareInstance].delegate = delegate;
}

+ (void)alertWithMessage:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithMessage:message cancelButtonTitle:@"取消" cancelButtonHandler:cancelButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithMessage:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithMessage:message defaultButtonTitle:@"确定" defaultButtonHandler:defaultButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithMessage:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithTitle:@"提示" message:message cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithTitle:@"提示" message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithMessage:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithTitle:@"提示" message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:presentingViewController];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithTitle:title message:message cancelButtonTitle:@"取消" cancelButtonHandler:cancelButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [self alertWithTitle:title message:message defaultButtonTitle:@"确定" defaultButtonHandler:defaultButtonHandler presentingViewController:presentingViewController];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:nil defaultButtonHandler:nil cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler destructiveButtonTitle:nil destructiveButtonHandler:nil presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:nil cancelButtonHandler:nil destructiveButtonTitle:nil destructiveButtonHandler:nil presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:nil defaultButtonHandler:nil cancelButtonTitle:nil cancelButtonHandler:nil destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:nil defaultButtonHandler:nil cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler  cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler destructiveButtonTitle:nil destructiveButtonHandler:nil presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler  cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleAlert];
}

+ (void)actionSheetWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:presentingViewController preferredStyle:UIAlertControllerStyleActionSheet];
}

- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler  cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    if ([ZYQuickAlertController shareInstance].delegate != [ZYQuickAlertController shareInstance] && [[ZYQuickAlertController shareInstance].delegate respondsToSelector:@selector(alertControllerWithTitle:message:defaultButtonTitle:defaultButtonHandler:cancelButtonTitle:cancelButtonHandler:destructiveButtonTitle:destructiveButtonHandler:presentingViewController:preferredStyle:)]) {
        [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:presentingViewController preferredStyle:preferredStyle];
        return;
    }
    if (!presentingViewController) return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (defaultButtonTitle.length > 0) {
        [alert addAction:[UIAlertAction actionWithTitle:defaultButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (defaultButtonHandler) {
                defaultButtonHandler();
            }
        }]];
    }
    
    if (cancelButtonTitle.length > 0) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelButtonHandler) {
                cancelButtonHandler();
            }
        }]];
    }
    
    if (destructiveButtonTitle.length > 0) {
        [alert addAction:[UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (destructiveButtonHandler) {
                destructiveButtonHandler();
            }
        }]];
    }
    
    [presentingViewController presentViewController:alert animated:YES completion:nil];
}

- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    if ([ZYQuickAlertController shareInstance].delegate != [ZYQuickAlertController shareInstance] && [[ZYQuickAlertController shareInstance].delegate respondsToSelector:@selector(alertControllerWithTitle:message:actionTitles:styles:handler:presentingViewController:preferredStyle:)]) {
        [[ZYQuickAlertController shareInstance].delegate alertControllerWithTitle:title message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:presentingViewController preferredStyle:preferredStyle];
        return;
    }
    if (!presentingViewController) return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    for (int i = 0; i < actionTitles.count; i++) {
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        if (i < styles.count) {
            style = [styles[i] intValue];
        }
        [alert addAction:[UIAlertAction actionWithTitle:actionTitles[i] style:style handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(i);
            }
        }]];
    }
    
    [presentingViewController presentViewController:alert animated:YES completion:nil];
}

@end
