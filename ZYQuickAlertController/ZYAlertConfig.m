//
//  ZYAlertConfig.m
//  Example
//
//  Created by XUZY on 2023/7/31.
//

#import "ZYAlertConfig.h"
#import "ZYQuickAlertController.h"

#define WeakSelf __weak __typeof(self)weakSelf = self;
#define StrongSelf __strong __typeof(weakSelf) strongSelf = weakSelf;

@interface ZYQuickAlertConfig ()

@end

@implementation ZYQuickAlertConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        WeakSelf;
        self.actions = [NSMutableArray array];
        self.textFieldBlocks = [NSMutableArray array];
        self.textFields = [NSMutableArray array];
        self.style = UIAlertControllerStyleAlert;
        
        self.setPresentingViewController = ^ZYQuickAlertConfig * _Nullable(UIViewController * _Nonnull viewController) {
            StrongSelf;
            strongSelf.presentingViewController = viewController;
            return strongSelf;
        };
        
        self.setTitle = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title) {
            StrongSelf;
            strongSelf.title = title;
            return strongSelf;
        };
        
        self.setMessage = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable message) {
            StrongSelf;
            strongSelf.message = message;
            return strongSelf;
        };
        
        self.setAlertStyle = ^ZYQuickAlertConfig * _Nullable(NSInteger style) {
            StrongSelf;
            strongSelf.style = style;
            return strongSelf;
        };
        
        self.addDefaultAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDefault;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addDefaultActionHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDefault;
            action.title = @"确定";
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addCancelAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleCancel;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addCancelActionHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleCancel;
            action.title = @"取消";
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addDestructiveAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDestructive;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addAction = ^ZYQuickAlertConfig * _Nullable(NSInteger style, NSString * _Nullable title, ZYQuickAlertActionBackBlock  _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = style;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        self.addActionConfig = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBlock _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            [strongSelf.actions addObject:action];
            if (block) {
                block(action);
            }
            return strongSelf;
        };
        
        self.addTextFieldWithConfigurationHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionTextFieldBlock  _Nonnull block) {
            StrongSelf;
            [strongSelf.textFieldBlocks addObject:block];
            return strongSelf;
        };
        
        self.alert = ^{
            StrongSelf;
            [ZYQuickAlertController alertWithConfig:strongSelf];
        };
    }
    return self;
}

@end

@implementation ZYAlertAction

@end
