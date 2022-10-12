//
//  UIViewController+ZYQuickAlertController.m
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import "UIViewController+ZYQuickAlertController.h"
#import "ZYQuickAlertController.h"

@implementation UIViewController (ZYQuickAlertController)

#pragma mark - AlertWithTitle
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message defaultButtonHandler:defaultButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithTitle:title message:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler {
    [ZYQuickAlertController alertWithTitle:title message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:self];
}

#pragma mark - AlertWithMessage 默认title为"提示"
- (void)alertWithMessage:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithMessage:message cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler {
    [ZYQuickAlertController alertWithMessage:message defaultButtonHandler:defaultButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler {
    [ZYQuickAlertController alertWithMessage:message cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler {
    [ZYQuickAlertController alertWithMessage:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler {
    [ZYQuickAlertController alertWithMessage:message destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [ZYQuickAlertController alertWithMessage:message destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [ZYQuickAlertController alertWithMessage:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController {
    [ZYQuickAlertController alertWithMessage:message defaultButtonTitle:defaultButtonTitle defaultButtonHandler:defaultButtonHandler destructiveButtonTitle:destructiveButtonTitle destructiveButtonHandler:destructiveButtonHandler cancelButtonTitle:cancelButtonTitle cancelButtonHandler:cancelButtonHandler presentingViewController:self];
}

- (void)alertWithMessage:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler {
    [ZYQuickAlertController alertWithMessage:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:self];
}

#pragma mark - ActionSheet
- (void)actionSheetWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler {
    [ZYQuickAlertController actionSheetWithTitle:title message:message actionTitles:actionTitles styles:styles handler:handler presentingViewController:self];
}

@end
