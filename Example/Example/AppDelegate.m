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
- (void)alertWithConfig:(ZYQuickAlertConfig *)config {
    if (!config) return ;
    
    if (!config.presentingViewController) return;
    SPAlertController *alert = [SPAlertController alertControllerWithTitle:config.title message:config.message preferredStyle:config.style];
    __weak typeof(config) weakConfig = config;
    for (int i = 0; i < config.actions.count; i++) {
        ZYAlertAction *zyAction = config.actions[i];
        [alert addAction:[SPAlertAction actionWithTitle:zyAction.title style:zyAction.style handler:^(SPAlertAction * _Nonnull action) {
            if (zyAction.block) {
                zyAction.block(weakConfig);
            }
        }]];
    }
    alert.textAlignment = config.messageTextAlignment;
    
    for (int i = 0; i < config.textFieldBlocks.count; i++) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            [config.textFields addObject:textField];
            config.textFieldBlocks[i](textField);
        }];
    }
    
    if (config.presentingViewController) {
        [config.presentingViewController presentViewController:alert animated:YES completion:nil];
    }else {
//        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

@end
