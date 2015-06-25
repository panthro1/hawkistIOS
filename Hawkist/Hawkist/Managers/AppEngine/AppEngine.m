//
//  AppEngine.m
//  Hawkist
//
//  Created by Svyatoslav Shaforenko on 6/17/15.
//  Copyright (c) 2015 TecSynt Solutions. All rights reserved.
//

#import "AppEngine.h"

@implementation AppEngine

#pragma mark -
#pragma mark Lifecycle
@synthesize user;
+ (instancetype) shared
{
    static AppEngine* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken, ^{
        sharedInstance = [[AppEngine alloc] init];
    });
    return sharedInstance;
}

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

#pragma mark -
#pragma mark Public

+ (BOOL) isFirsTimeLaunch
{
    BOOL isFirstTime = ![[[NSUserDefaults standardUserDefaults] objectForKey: @"isFirstTime"] boolValue];
    if(isFirstTime)
        [[NSUserDefaults standardUserDefaults] setObject: @(YES) forKey: @"isFirstTime"];
    return isFirstTime;
}

#pragma mark -
#pragma mark Setters/Getters

- (void) setPin: (NSString*) pin
{
     [[NSUserDefaults standardUserDefaults] setObject: pin forKey: @"pin"];
}

- (NSString*) pin
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"pin"];
}

- (void) setNumber: (NSString*) number
{
    [[NSUserDefaults standardUserDefaults] setObject: number forKey: @"number"];

}


- (NSString*) number
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"number"];

}

@end
