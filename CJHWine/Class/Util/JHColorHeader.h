//
//  JHColorHeader.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#ifndef JHColorHeader_h
#define JHColorHeader_h

#define RGB(r,g,b) RGBA(r,g,b,1.0)
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define THEME_COLOR RGB(250, 98, 97)

#define BASE_COLOR RGBA(243, 243, 246, 1.0)

#define BACK_COLOR RGBA(240,240,240,1)

#define BASE_COLOR1 RGBA(210, 210, 210, 1.0)

#define THEME_COLOR_ALPHA RGBA(250, 98, 97, 0.99)

#define BLACK_COLOR RGBA(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色

#endif /* JHColorHeader_h */
