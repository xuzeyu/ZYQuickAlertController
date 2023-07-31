//
//  UIViewController+ZYQuickAlertController.m
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import "UIViewController+ZYQuickAlertController.h"
#import "ZYQuickAlertController.h"

@implementation UIViewController (ZYQuickAlertController)

- (ZYQuickAlertConfig *)zyAlert {
    ZYQuickAlertConfig *config = [[ZYQuickAlertConfig alloc] init];
    config.presentingViewController = self;
    return config;
}

@end
