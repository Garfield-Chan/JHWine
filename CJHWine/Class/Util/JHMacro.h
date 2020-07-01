//
//  JHMacro.h
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#ifndef JHMacro_h
#define JHMacro_h

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

#define WS(weakSelf) __weak__ __typeof(&*self)weakSelf = self;

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define DEBUGLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...) {}
#define DEBUGLog(...)
#endif

#endif /* JHMacro_h */
