//
//  ADJUserDefaults.m
//  Adjust
//
//  Created by Uglješa Erceg on 16.08.17.
//  Copyright © 2017 adjust GmbH. All rights reserved.
//

#import "ADJUserDefaults.h"

static NSString * const PREFS_KEY_PUSH_TOKEN = @"adj_push_token";
static NSString * const PREFS_KEY_INSTALL_TRACKED = @"adj_install_tracked";

@implementation ADJUserDefaults

#pragma mark - Object lifecycle methods

+ (id)getInstance {
    static ADJUserDefaults *defaultInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        defaultInstance = [[self alloc] init];
    });

    return defaultInstance;
}

- (id)init {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    return self;
}

#pragma mark - Public methods

+ (void)savePushToken:(NSString *)pushToken {
    [[NSUserDefaults standardUserDefaults] setObject:pushToken forKey:PREFS_KEY_PUSH_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getPushToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:PREFS_KEY_PUSH_TOKEN];
}

+ (void)removePushToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:PREFS_KEY_PUSH_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setInstallTracked {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PREFS_KEY_INSTALL_TRACKED];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getInstallTracked {
    return [[NSUserDefaults standardUserDefaults] boolForKey:PREFS_KEY_INSTALL_TRACKED];
}

@end
