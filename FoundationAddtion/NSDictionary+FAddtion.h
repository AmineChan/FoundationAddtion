//
//  NSDictionary+FAddtion.h
//  
//
//  Created by czm on 13-11-14.
//  Copyright (c) 2013年 czm. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType> (NSDictionaryAddtion)

- (nullable ObjectType)objectForKeyConvertNullToNil:(KeyType)aKey;
- (nullable ObjectType)objectForKeyConvertNullOrNilToSpace:(KeyType)aKey;

@end

@interface NSMutableDictionary<KeyType, ObjectType> (Addtion)

- (void)setObjectIgnoreNull:(nullable ObjectType)anObject forKey:(KeyType)aKey;

@end

NS_ASSUME_NONNULL_END
