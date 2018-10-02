//
//  FirebaseService.m
//  FirebaseCocoaTouchFramework
//
//  Created by Andrey on 28.08.2018.
//  Copyright © 2018 Андрей Недов. All rights reserved.
//

#import "FirebaseService.h"
#import <FirebaseCore/FirebaseCore.h>
#import "Firebase.h"
@interface FirebaseService () <FIRMessagingDelegate>
@end
@implementation FirebaseService

+ (FirebaseService *)sharedManager {
    static FirebaseService *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (NSString *)getFCMToken{
    return [FIRMessaging messaging].FCMToken;
}

- (void)messagingDelegate:(id <FirebaseServiceDelegate>)delegate{
    self.delegate = delegate;
    [FIRMessaging messaging].delegate = self;
}

- (void)configure{
    [FIRApp configure];
}

#pragma mark FirebaseCloudMessaging

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken{
    [self.delegate messaging:messaging didRefreshRegistrationToken:fcmToken];
}

- (void)messaging:(FIRMessaging *)messaging didReceiveMessage:(FIRMessagingRemoteMessage *)remoteMessage {
    [self.delegate messaging:messaging didReceiveMessage:remoteMessage];
}

@end
