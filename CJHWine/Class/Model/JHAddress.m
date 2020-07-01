//
//  JHAddress.m
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHAddress.h"
#import <objc/runtime.h>

@implementation JHAddress

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"不能识别key -- %@", key);
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
