//
//  JHBindProtocol.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JHBindProtocol <NSObject>

// 绑定viewModel
- (instancetype)bindViewModel:(id)viewModel;

@end

