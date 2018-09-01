//
//  FirebaseService.h
//  FirebaseCocoaTouchFramework
//
//  Created by Andrey on 28.08.2018.
//  Copyright © 2018 Андрей Недов. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FIRMessaging;
@class FIRMessagingRemoteMessage;
@protocol FirebaseServiceDelegate <NSObject>
@required
- (void)messaging:(nonnull FIRMessaging *)messaging didRefreshRegistrationToken:(nonnull NSString *)fcmToken;
- (void)messaging:(FIRMessaging *)messaging didReceiveMessage:(FIRMessagingRemoteMessage *)remoteMessage;
- (void)subscribeForRemoteNotificationsWithFCMToken:(nonnull NSString *)fcmToken;
@end

@interface FirebaseService : NSObject 
@property (weak, nonatomic) id <FirebaseServiceDelegate> delegate;
+ (FirebaseService *)sharedManager;
- (void)configure;
- (NSString *)getFCMToken;
- (void)messagingDelegate;
@end
