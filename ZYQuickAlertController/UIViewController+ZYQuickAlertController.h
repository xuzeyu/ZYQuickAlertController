//
//  UIViewController+ZYQuickAlertController.h
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZYQuickAlertController)

//AlertWithTitle
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler;
- (void)alertWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
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
- (void)alertWithMessage:(NSString * _Nullable)message defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler;
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

NS_ASSUME_NONNULL_END
