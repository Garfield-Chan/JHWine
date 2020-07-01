//
//  JHUser.m
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHUser.h"
#import <objc/runtime.h>

@implementation JHUser

+ (instancetype)currentUser{
    static JHUser *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[JHUser alloc]init];
        user.isSound = YES;
        user.isShake = YES;
        user.sex = YES;
        user.bageValue = 0;
        user.address = [NSMutableArray arrayWithCapacity:42];
    });
    return user;
}

- (void)setBageValue:(NSInteger)bageValue{
    _bageValue = bageValue;
    if (bageValue < 0) {
        _bageValue = 0;
    }
}

-(BOOL)isLogin{
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"user"]) {
        return YES;
    }
    return NO;
}

-(JHAddress *)defaultAddress{
    if (!_defaultAddress) {
        if (self.address.count >= 1) {
            _defaultAddress = self.address[0];
        }else{
            _defaultAddress = [[JHAddress alloc]init];
            _defaultAddress.u_name = [JHUser currentUser].nickName;
            _defaultAddress.u_phone = [JHUser currentUser].phoneNum;
            _defaultAddress.u_address = @"";
        }
    }
    return _defaultAddress;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([coder decodeObjectForKey:key]) {
            [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end
