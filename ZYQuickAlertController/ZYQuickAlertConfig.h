//
//  ZYQuickAlertConfig.h
//  Example
//
//  Created by XUZY on 2023/7/31.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYQuickAlertConfig;
@class ZYQuickAlertAction;

//弹框类型
typedef NS_ENUM(NSUInteger, ZYQuickAlertType) {
    ZYQuickAlertTypeCustom = 0,//自定义弹框，有自定义弹框则用自定义，没有则使用原生
    ZYQuickAlertTypeNative,//原生弹框
};

typedef void (^ZYQuickAlertActionText)(NSString *text);
typedef void (^ZYQuickAlertActionBlock)(ZYQuickAlertAction * __nullable action);
typedef void (^ZYQuickAlertActionBackBlock)(ZYQuickAlertConfig *config);
typedef void (^ZYQuickAlertActionTextFieldBlock)(UITextField *textField);

@interface ZYQuickAlertConfig : NSObject
@property (nonatomic, strong) UIViewController *presentingViewController;
@property (nonatomic, assign) ZYQuickAlertType type; ///<弹框类型，初始为默认弹框
@property(nonatomic, assign) CGFloat minDistanceToEdges;///<距离屏幕边缘的最小间距
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) NSAttributedString *titleAttributedString;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIFont *messageFont;
@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, strong) NSAttributedString *messageAttributedString;
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, strong) NSMutableArray <ZYQuickAlertAction *> *actions;
@property (nonatomic, strong) NSMutableArray <UITextField *> *textFields;
@property (nonatomic, strong) NSMutableArray <ZYQuickAlertActionTextFieldBlock > *textFieldBlocks;
@property (nonatomic, assign) NSTextAlignment messageTextAlignment;

//链式快速设置
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sPresentingViewController)(UIViewController *viewController);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMinDistanceToEdges)(CGFloat minDistanceToEdges);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sTitle)(NSString * __nullable title);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sTitleFont)(UIFont * __nullable titleFont);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sTitleColor)(UIColor * __nullable titleColor);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sTitleAttributedString)(NSAttributedString * __nullable titleAttributedString);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessage)(NSString * __nullable message);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessageFont)(UIFont * __nullable messageFont);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessageColor)(UIColor * __nullable messageColor);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessageAttributedString)(NSAttributedString * __nullable messageAttributedString);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sAlertStyle)(NSInteger style);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessageTextAlignment)(NSTextAlignment messageTextAlignment);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDefaultAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDefaultActionHandler)(ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addCancelAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addCancelActionHandler)(ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDestructiveAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addAction)(UIAlertActionStyle style, NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addActionConfig)(ZYQuickAlertActionBlock block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addTextFieldWithConfigurationHandler)(ZYQuickAlertActionTextFieldBlock block);

@property (nonatomic, copy, readonly) void (^alert)(void);

- (ZYQuickAlertConfig *)sDefTitle;
@end

@interface ZYQuickAlertAction : NSObject
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) ZYQuickAlertActionBackBlock block;
@end




NS_ASSUME_NONNULL_END
