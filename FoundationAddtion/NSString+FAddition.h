//
//  NSString+FAddition.h
// 
//
//  Created by czm on 13-9-24.
//  Copyright (c) 2013年 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FAddition)

+ (NSString *)generateUUID;//Returns a lowercase NSString uuid.
+ (NSString *)convertNullToSpace:(nullable NSString *)str;

- (NSString *)trim;
- (NSString *)hiddenMobilePhoneMid;//hidden [4~7]

@end

@interface NSString (URLAddition)

- (NSString *)URLEncode;
- (NSString *)URLDecode;
- (NSString *)escapingHTML;
- (NSString *)httpURLCompletion;
- (NSString *)httpsURLCompletion;

@end

@interface NSString (CheckAddtion)

+ (BOOL)isEmpty:(NSString *)str;
- (BOOL)isEmpty;
- (BOOL)isDigital;
- (BOOL)isEmail;
- (BOOL)isChineseMobile;
- (BOOL)isIDCard;
- (BOOL)isContactNo;//Tel no or mobile no.
- (BOOL)firstIsLetter;
- (BOOL)containsStringForAllVersion:(NSString *)str;

@end

@interface NSString (HashAddtion)

- (nullable NSString *)md5String;// 32 bit
- (nullable NSString *)md5_16bitString;// 16 bit

- (nullable NSString *)sha1String;
- (nullable NSString *)sha224String;
- (nullable NSString *)sha256String;
- (nullable NSString *)sha384String;
- (nullable NSString *)sha512String;

- (nullable NSString *)hmacMD5StringWithKey:(NSString *)key;
- (nullable NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (nullable NSString *)hmacSHA224StringWithKey:(NSString *)key;
- (nullable NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (nullable NSString *)hmacSHA384StringWithKey:(NSString *)key;
- (nullable NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSString *)crc32String;

@end

@interface NSString (PathsAddtion)

+ (NSString *)cachesPath;
+ (NSString *)documentsPath;
+ (NSString *)temporaryPath;
+ (NSString *)pathForTemporaryFile;

@end

NS_ASSUME_NONNULL_END
