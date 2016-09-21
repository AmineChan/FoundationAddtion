//
//  NSObject+FAdition.h
//
//
//  Created by czm on 16/3/24.
//  Copyright © 2016年 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FAdition)

/**
 Exchanges two method implementations. After the call methods to the first selector will now go to the second one and vice versa.
 @param selector The first method
 @param otherSelector The second method
 */
+ (void)fa_swizzleMethod:(SEL)selector withMethod:(SEL)otherSelector;


/**
 Exchanges two class method implementations. After the call methods to the first selector will now go to the second one and vice versa.
 @param selector The first method
 @param otherSelector The second method
 */
+ (void)fa_swizzleClassMethod:(SEL)selector withMethod:(SEL)otherSelector;

@end
