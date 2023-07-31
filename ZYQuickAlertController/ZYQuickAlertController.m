//
//  ZYQuickAlertController.m
//  Example
//
//  Created by XUZY on 2022/9/16.
//

#import "ZYQuickAlertController.h"

@interface ZYQuickAlertController() <ZYQuickAlertControllerDelegate>
@property (nonatomic, weak) NSObject <ZYQuickAlertControllerDelegate> *delegate;
@end

@implementation ZYQuickAlertController

+ (instancetype)shareInstance {
    static ZYQuickAlertController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZYQuickAlertController alloc] init];
        instance.delegate = instance;
    });
    return instance;
}

+ (void)setDelegate:(NSObject <ZYQuickAlertControllerDelegate> *)delegate {
    [ZYQuickAlertController shareInstance].delegate = delegate;
}

#pragma mark - Other
- (void)alertWithConfig:(ZYQuickAlertConfig *)config {
    if(!config) return ;
    if ([ZYQuickAlertController shareInstance].delegate != [ZYQuickAlertController shareInstance] && [[ZYQuickAlertController shareInstance].delegate respondsToSelector:@selector(alertWithConfig:)]) {
        [[ZYQuickAlertController shareInstance].delegate alertWithConfig:config];
        return;
    }
    
    if (!config.presentingViewController) return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:config.title message:config.message preferredStyle:config.style];
    for (int i = 0; i < config.actions.count; i++) {
        ZYAlertAction *zyAction = config.actions[i];
        [alert addAction:[UIAlertAction actionWithTitle:zyAction.title style:zyAction.style handler:^(UIAlertAction * _Nonnull action) {
            zyAction.block(config);
        }]];
    }
    
    for (int i = 0; i < config.textFieldBlocks.count; i++) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            [config.textFields addObject:textField];
            config.textFieldBlocks[i](textField);
        }];
    }
    
    [config.presentingViewController presentViewController:alert animated:YES completion:nil];
}

+ (void)alertWithConfig:(ZYQuickAlertConfig *)config {
    [[ZYQuickAlertController shareInstance].delegate alertWithConfig:config];
}

@end
