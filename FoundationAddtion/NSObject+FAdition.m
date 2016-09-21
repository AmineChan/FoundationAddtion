//
//  NSObject+FAdition.m
//
//
//  Created by czm on 16/3/24.
//  Copyright © 2016年 czm. All rights reserved.
//

#import "NSObject+FAdition.h"
#import <objc/runtime.h>

@implementation NSObject (FAdition)
+ (void)fa_swizzleMethod:(SEL)selector withMethod:(SEL)otherSelector
{
    Class class = object_getClass(self);

    // get the methods from the selectors
    Method originalMethod = class_getInstanceMethod(class, selector);
    Method otherMethod = class_getInstanceMethod(class, otherSelector);

    if (class_addMethod(class, selector, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod)))
    {
        class_replaceMethod(class, otherSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, otherMethod);
    }
}

+ (void)fa_swizzleClassMethod:(SEL)selector withMethod:(SEL)otherSelector
{
    Class class = object_getClass(self);

    // get the methods from the selectors
    Method originalMethod = class_getClassMethod(class, selector);
    Method otherMethod = class_getClassMethod(class, otherSelector);

    method_exchangeImplementations(originalMethod, otherMethod);
}

@end
