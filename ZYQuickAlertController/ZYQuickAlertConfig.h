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
@class ZYAlertAction;

typedef void (^ZYQuickAlertActionText)(NSString *text);
typedef void (^ZYQuickAlertActionBlock)(ZYAlertAction * __nullable action);
typedef void (^ZYQuickAlertActionBackBlock)(ZYQuickAlertConfig *config);
typedef void (^ZYQuickAlertActionTextFieldBlock)(UITextField *textField);

@interface ZYQuickAlertConfig : NSObject
@property (nonatomic, strong) UIViewController *presentingViewController;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, strong) NSMutableArray <ZYAlertAction *> *actions;
@property (nonatomic, strong) NSMutableArray <UITextField *> *textFields;
@property (nonatomic, strong) NSMutableArray <ZYQuickAlertActionTextFieldBlock > *textFieldBlocks;

//链式快速设置
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sPresentingViewController)(UIViewController *viewController);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sTitle)(NSString * __nullable title);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sMessage)(NSString * __nullable message);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^sAlertStyle)(NSInteger style);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDefaultAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDefaultActionHandler)(ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addCancelAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addCancelActionHandler)(ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addDestructiveAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addAction)(UIAlertActionStyle style, NSString * __nullable title, ZYQuickAlertActionBackBlock __nullable block);
@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addActionConfig)(ZYQuickAlertActionBlock block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^addTextFieldWithConfigurationHandler)(ZYQuickAlertActionTextFieldBlock block);

@property (nonatomic, copy, readonly) ZYQuickAlertConfig * (^alert)(void);
@end

@interface ZYAlertAction : NSObject
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) ZYQuickAlertActionBackBlock block;
@end




NS_ASSUME_NONNULL_END
