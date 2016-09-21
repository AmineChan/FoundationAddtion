//
//  NSData+FAddition.h
//
//
//  Created by czm on 16-3-21.
//  Copyright (c) 2016年 czm. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (FAddition)

- (NSString *)md5String;//Returns a lowercase NSString
- (NSData *)md5Data;

- (NSString *)sha1String;//Returns a lowercase NSString
- (NSData *)sha1Data;

- (NSString *)sha224String;//Returns a lowercase NSString
- (NSData *)sha224Data;

- (NSString *)sha256String;//Returns a lowercase NSString
- (NSData *)sha256Data;

- (NSString *)sha384String;//Returns a lowercase NSString
- (NSData *)sha384Data;

- (NSString *)sha512String;//Returns a lowercase NSString
- (NSData *)sha512Data;

- (NSString *)hmacMD5StringWithKey:(NSString *)key;
- (NSData *)hmacMD5DataWithKey:(NSData *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSData *)hmacSHA1DataWithKey:(NSData *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;
- (NSData *)hmacSHA224DataWithKey:(NSData *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSData *)hmacSHA256DataWithKey:(NSData *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;
- (NSData *)hmacSHA384DataWithKey:(NSData *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;
- (NSData *)hmacSHA512DataWithKey:(NSData *)key;

- (NSString *)crc32String;
- (uint32_t)crc32;

#pragma mark - Encrypt and Decrypt
- (nullable NSData *)aes256EncryptWithKey:(NSData *)key iv:(nullable NSData *)iv;
- (nullable NSData *)aes256DecryptWithkey:(NSData *)key iv:(nullable NSData *)iv;


#pragma mark - Encode and decode
- (nullable NSString *)utf8String;
- (nullable NSString *)hexString;
+ (nullable NSData *)dataWithHexString:(NSString *)hexString;

- (nullable NSString *)base64EncodedString;
+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

- (nullable id)jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END
