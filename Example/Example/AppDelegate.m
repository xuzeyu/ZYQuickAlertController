//
//  AppDelegate.m
//  Example
//
//  Created by XUZY on 2022/8/26.
//

#import "AppDelegate.h"
#import "SPAlertController.h"
#import "ZYQuickAlertController.h"

@interface AppDelegate () <ZYQuickAlertControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ZYQuickAlertController setDelegate:self];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark - ZYQuickAlertControllerDelegate
- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message defaultButtonTitle:(NSString * _Nullable)defaultButtonTitle defaultButtonHandler:(void (^ __nullable)(void))defaultButtonHandler destructiveButtonTitle:(NSString * _Nullable)destructiveButtonTitle destructiveButtonHandler:(void (^ __nullable)(void))destructiveButtonHandler cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle cancelButtonHandler:(void (^ __nullable)(void))cancelButtonHandler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:title message:message preferredStyle:(SPAlertControllerStyle)preferredStyle];
    if (defaultButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:defaultButtonTitle style:SPAlertActionStyleDefault handler:^(SPAlertAction * _Nonnull action) {
            if (defaultButtonHandler) {
                defaultButtonHandler();
            }
        }]];
    }
    
    if (cancelButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:cancelButtonTitle style:SPAlertActionStyleDefault handler:^(SPAlertAction * _Nonnull action) {
            if (cancelButtonHandler) {
                cancelButtonHandler();
            }
        }]];
    }
    
    if (destructiveButtonTitle.length > 0) {
        [alert addAction:[SPAlertAction actionWithTitle:destructiveButtonTitle style:SPAlertActionStyleDestructive handler:^(SPAlertAction * _Nonnull action) {
            if (destructiveButtonHandler) {
                destructiveButtonHandler();
            }
        }]];
    }
    
    if (presentingViewController) {
        [presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)alertControllerWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message actionTitles:(NSArray * _Nonnull)actionTitles styles:(NSArray <NSNumber *>* _Nonnull)styles handler:(void (^ __nullable)(int index))handler presentingViewController:(UIViewController * _Nullable)presentingViewController preferredStyle:(UIAlertControllerStyle)preferredStyle {
    if (!message) return;
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:title message:message preferredStyle:SPAlertControllerStyleAlert];
    for (int i = 0; i < actionTitles.count; i++) {
        SPAlertActionStyle style = SPAlertActionStyleDefault;
        if (i < styles.count) {
            style = [styles[i] intValue];
        }
        [alert addAction:[SPAlertAction actionWithTitle:actionTitles[i] style:style handler:^(SPAlertAction * _Nonnull action) {
            if (handler) {
                handler(i);
            }
        }]];
    }
    
    if (presentingViewController) {
        [presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

@end
