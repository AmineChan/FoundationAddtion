//
//  NSDictionary+FAddtion.m
//  
//
//  Created by czm on 13-11-14.
//  Copyright (c) 2013年 czm. All rights reserved.
//

#import "NSDictionary+FAddtion.h"

@implementation NSDictionary (NSDictionaryAddtion)

- (id)objectForKeyConvertNullToNil:(id)aKey
{
    id value = [self objectForKey:aKey];
    if ([[NSNull null] isEqual:value])
    {
        value = nil;
    }
    
    return value;
}

- (id)objectForKeyConvertNullOrNilToSpace:(id)aKey
{
    id value = [self objectForKey:aKey];
    if ([[NSNull null] isEqual:value] || !value)
    {
        value = @"";
    }
    
    return value;
}

@end

@implementation NSMutableDictionary (Addtion)

- (void)setObjectIgnoreNull:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey)
    {
        [self setObject:anObject forKey:aKey];
    }
}

@end
