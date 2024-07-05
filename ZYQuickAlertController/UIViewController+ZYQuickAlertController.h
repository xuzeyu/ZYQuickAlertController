//
//  UIViewController+ZYQuickAlertController.h
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import <UIKit/UIKit.h>
#import "ZYQuickAlertConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZYQuickAlertController)
- (ZYQuickAlertConfig *)zyAlert; ///<原生弹框
- (ZYQuickAlertConfig *)zyAlertCustom;///<自定义弹框
+ (ZYQuickAlertConfig *)zyAlert; ///<原生弹框
+ (ZYQuickAlertConfig *)zyAlertCustom;///<自定义弹框
@end

NS_ASSUME_NONNULL_END
