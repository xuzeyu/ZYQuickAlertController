//
//  ZYQuickAlertConfig.m
//  Example
//
//  Created by XUZY on 2023/7/31.
//

#import "ZYQuickAlertConfig.h"
#import "ZYQuickAlertController.h"
#import <objc/runtime.h>

#define WeakSelf __weak __typeof(self)weakSelf = self;
#define StrongSelf __strong __typeof(weakSelf) strongSelf = weakSelf;
@interface NSObject (ZYQuickAlertController)
@property (nonatomic, strong) ZYQuickAlertConfig *config;
@end

@implementation NSObject (ZYQuickAlertController)

- (ZYQuickAlertConfig *)config {
    return objc_getAssociatedObject(self, @selector(config));
}

- (void)setConfig:(ZYQuickAlertConfig *)config {
    objc_setAssociatedObject(self, @selector(config), config, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface ZYQuickAlertConfig ()

@end

@implementation ZYQuickAlertConfig
@synthesize sPresentingViewController=_sPresentingViewController;
@synthesize sMinDistanceToEdges=_sMinDistanceToEdges;
@synthesize sTitle=_sTitle;
@synthesize sTitleFont=_sTitleFont;
@synthesize sTitleColor=_sTitleColor;
@synthesize sTitleAttributedString=_sTitleAttributedString;
@synthesize sMessage=_sMessage;
@synthesize sMessageFont=_sMessageFont;
@synthesize sMessageColor=_sMessageColor;
@synthesize sMessageAttributedString=_sMessageAttributedString;
@synthesize sAlertStyle=_sAlertStyle;
@synthesize sMessageTextAlignment = _sMessageTextAlignment;
@synthesize addDefaultAction=_addDefaultAction;
@synthesize addDefaultActionHandler=_addDefaultActionHandler;
@synthesize addCancelAction=_addCancelAction;
@synthesize addCancelActionHandler=_addCancelActionHandler;
@synthesize addDestructiveAction=_addDestructiveAction;
@synthesize addAction=_addAction;
@synthesize addActionConfig=_addActionConfig;
@synthesize addTextFieldWithConfigurationHandler=_addTextFieldWithConfigurationHandler;
@synthesize alert=_alert;


- (instancetype)init
{
    self = [super init];
    if (self) {
        WeakSelf;
        self.actions = [NSMutableArray array];
        self.textFieldBlocks = [NSMutableArray array];
        self.textFields = [NSMutableArray array];
        self.style = UIAlertControllerStyleAlert;
        
        _sPresentingViewController = ^ZYQuickAlertConfig * _Nullable(UIViewController * __nullable viewController) {
            StrongSelf;
            strongSelf.presentingViewController = viewController;
            return strongSelf;
        };
        
        _sMinDistanceToEdges = ^ZYQuickAlertConfig * _Nullable(CGFloat minDistanceToEdges) {
            StrongSelf;
            strongSelf.minDistanceToEdges = minDistanceToEdges;
            return strongSelf;
        };
        
        _sTitle = ^ZYQuickAlertConfig * _Nullable(NSString * __nullable title) {
            StrongSelf;
            strongSelf.title = title;
            return strongSelf;
        };
        
        _sTitleFont = ^ZYQuickAlertConfig * _Nullable(UIFont * __nullable titleFont) {
            StrongSelf;
            strongSelf.titleFont = titleFont;
            return strongSelf;
        };
        
        _sTitleColor = ^ZYQuickAlertConfig * _Nullable(UIColor * __nullable titleColor) {
            StrongSelf;
            strongSelf.titleColor = titleColor;
            return strongSelf;
        };
        
        _sTitleAttributedString = ^ZYQuickAlertConfig * _Nullable(NSAttributedString * __nullable titleAttributedString) {
            StrongSelf;
            strongSelf.titleAttributedString = titleAttributedString;
            return strongSelf;
        };
        
        _sMessage = ^ZYQuickAlertConfig * _Nullable(NSString * __nullable message) {
            StrongSelf;
            strongSelf.message = message;
            return strongSelf;
        };
        
        _sMessageFont = ^ZYQuickAlertConfig * _Nullable(UIFont * __nullable messageFont) {
            StrongSelf;
            strongSelf.messageFont = messageFont;
            return strongSelf;
        };
        
        _sMessageColor = ^ZYQuickAlertConfig * _Nullable(UIColor * __nullable messageColor) {
            StrongSelf;
            strongSelf.messageColor = messageColor;
            return strongSelf;
        };
        
        _sMessageAttributedString = ^ZYQuickAlertConfig * _Nullable(NSAttributedString * __nullable messageAttributedString) {
            StrongSelf;
            strongSelf.messageAttributedString = messageAttributedString;
            return strongSelf;
        };
        
        _sAlertStyle = ^ZYQuickAlertConfig * _Nullable(NSInteger style) {
            StrongSelf;
            strongSelf.style = style;
            return strongSelf;
        };
        
        _sMessageTextAlignment = ^ZYQuickAlertConfig * _Nullable(NSTextAlignment messageTextAlignment) {
            StrongSelf;
            strongSelf.messageTextAlignment = messageTextAlignment;
            return strongSelf;
        };
        
        _addDefaultAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDefault;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addDefaultActionHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDefault;
            action.title = @"确定";
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addCancelAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleCancel;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addCancelActionHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleCancel;
            action.title = @"取消";
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addDestructiveAction = ^ZYQuickAlertConfig * _Nullable(NSString * _Nullable title, ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = UIAlertActionStyleDestructive;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addAction = ^ZYQuickAlertConfig * _Nullable(NSInteger style, NSString * _Nullable title, ZYQuickAlertActionBackBlock  __nullable block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            action.style = style;
            action.title = title;
            action.block = block;
            [strongSelf.actions addObject:action];
            return strongSelf;
        };
        
        _addActionConfig = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionBlock _Nonnull block) {
            StrongSelf;
            ZYAlertAction *action = [[ZYAlertAction alloc] init];
            [strongSelf.actions addObject:action];
            if (block) {
                block(action);
            }
            return strongSelf;
        };
        
        _addTextFieldWithConfigurationHandler = ^ZYQuickAlertConfig * _Nullable(ZYQuickAlertActionTextFieldBlock  _Nonnull block) {
            StrongSelf;
            [strongSelf.textFieldBlocks addObject:block];
            return strongSelf;
        };
        
        _alert = ^ZYQuickAlertConfig *(void){
            StrongSelf;
            [ZYQuickAlertController alertWithConfig:strongSelf];
            return strongSelf;
        };
    }
    return self;
}

- (ZYQuickAlertConfig *)sDefTitle {
    self.title = @"提示";
    return self;
}

@end

@implementation ZYAlertAction

@end


