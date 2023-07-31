//
//  ZYQuickAlertController.h
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import <UIKit/UIKit.h>
#import "ZYAlertConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZYQuickAlertControllerDelegate

- (void)alertWithConfig:(ZYQuickAlertConfig *)config;

@end

@interface ZYQuickAlertController : NSObject

+ (void)setDelegate:(NSObject <ZYQuickAlertControllerDelegate> *)delegate;

+ (void)alertWithConfig:(ZYQuickAlertConfig *)config;
@end

NS_ASSUME_NONNULL_END
