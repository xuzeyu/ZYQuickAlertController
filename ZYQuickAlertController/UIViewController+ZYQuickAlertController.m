//
//  UIViewController+ZYQuickAlertController.m
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import "UIViewController+ZYQuickAlertController.h"

@implementation UIViewController (ZYQuickAlertController)

- (ZYQuickAlertConfig *)zyAlert {
    ZYQuickAlertConfig *config = [[ZYQuickAlertConfig alloc] init];
    config.type = ZYQuickAlertTypeNative;
    config.presentingViewController = self;
    return config;
}

- (ZYQuickAlertConfig *)zyAlertCustom {
    ZYQuickAlertConfig *config = [[ZYQuickAlertConfig alloc] init];
    config.type = ZYQuickAlertTypeCustom;
    config.presentingViewController = self;
    return config;
}

+ (ZYQuickAlertConfig *)zyAlert {
    ZYQuickAlertConfig *config = [[ZYQuickAlertConfig alloc] init];
    config.type = ZYQuickAlertTypeNative;
    config.presentingViewController = [self currentViewController];
    return config;
}

+ (ZYQuickAlertConfig *)zyAlertCustom {
    ZYQuickAlertConfig *config = [[ZYQuickAlertConfig alloc] init];
    config.type = ZYQuickAlertTypeCustom;
    config.presentingViewController = [self currentViewController];
    return config;
}

+ (UIViewController *)currentViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
