//
//  JHMacro.h
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#ifndef JHMacro_h
#define JHMacro_h

#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height

#define isPhoneX (kWidth>=375 && kHeight >=812)

#define kStatusHeight (isPhoneX?44:20)
#define kNavBarHeight 44
#define kStatusAndNavHeight (isPhoneX?88:64)
#define kTabBarHeight (isPhoneX?83:49)



#define WS(weakSelf) __weak__ __typeof(&*self)weakSelf = self;

///读取用户数据完成
#define READ_USER_DATA_FINISH @"readUserDataFinish"



//Log
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define DEBUGLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...) {}
#define DEBUGLog(...)
#endif

#endif /* JHMacro_h */
