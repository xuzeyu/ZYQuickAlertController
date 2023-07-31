//
//  ZYAlertConfig.h
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
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^setPresentingViewController)(UIViewController *viewController);
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^setTitle)(NSString * __nullable title);
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^setMessage)(NSString * __nullable message);
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^setAlertStyle)(NSInteger style);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addDefaultAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock block);
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addDefaultActionHandler)(ZYQuickAlertActionBackBlock block);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addCancelAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock block);
@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addCancelActionHandler)(ZYQuickAlertActionBackBlock block);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addDestructiveAction)(NSString * __nullable title, ZYQuickAlertActionBackBlock block);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addAction)(UIAlertActionStyle style, NSString * __nullable title, ZYQuickAlertActionBackBlock block);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addActionConfig)(ZYQuickAlertActionBlock);

@property (nonatomic, copy) ZYQuickAlertConfig * __nullable(^addTextFieldWithConfigurationHandler)(ZYQuickAlertActionTextFieldBlock block);

@property (nonatomic, copy) void (^alert)(void);
@end

@interface ZYAlertAction : NSObject
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, copy) ZYQuickAlertActionBackBlock block;
@end




NS_ASSUME_NONNULL_END
