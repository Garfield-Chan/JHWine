//
//  JHAddress.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHAddress : NSObject<NSCoding>

@property (nonatomic, copy)NSString *u_name;
@property (nonatomic, copy)NSString *u_address;
@property (nonatomic, copy)NSString *u_phone;
@property (nonatomic, assign)BOOL *u_sex;
@property (nonatomic, copy)NSString *u_detailAddress;

@end

NS_ASSUME_NONNULL_END
