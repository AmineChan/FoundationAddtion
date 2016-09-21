//
//  NSDate+FAddition.h
//
//
//  Created by czm on 13-9-24.
//  Copyright (c) 2013年 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kDateFormatISO;                      // yyyy-MM-dd'T'HH:mm:ssZ
extern NSString *const kDateFormat_yyyyMMdd_joinedByDot;    // yyyy.MM.dd
extern NSString *const kDateFormat_yyyyMMdd_joinedByMinus;  // yyyy-MM-dd
extern NSString *const kDateFormat_yyyyMMdd_joinedByVirgule;// yyyy/MM/dd

@interface NSDate (NSDateAddtion)

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;        // start from 1.
@property (nonatomic, readonly) NSInteger day;          // start from 1.
@property (nonatomic, readonly) NSInteger hour;         // 0~23
@property (nonatomic, readonly) NSInteger minute;       // 0~59
@property (nonatomic, readonly) NSInteger second;       // 0~59
@property (nonatomic, readonly) NSInteger weekday;      // 1~7, Sunday=1
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, readonly) NSInteger weekOfMonth;  // start from 1.
@property (nonatomic, readonly) NSInteger weekOfYear;   // start from 1.
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, readonly) NSInteger quarter;
@property (nonatomic, readonly) NSUInteger numberOfDaysInCurrentMonth;

+ (NSDateFormatter *)ISOFormatter; // singleton.

@end

@interface NSDate (NSDateChangeAddtion)

- (nullable NSDate *)addingYears:(NSUInteger)years;     // e.g. lastYear:[date addingYears:-1] nextYear:[date addingYears:1]
- (nullable NSDate *)addingMonths:(NSUInteger)months;
- (NSDate *)addingDays:(NSUInteger)days;
- (NSDate *)addingHours:(NSUInteger)hours;
- (NSDate *)addingMinutes:(NSUInteger)minutes;
- (NSDate *)addingSeconds:(NSUInteger)seconds;

- (nullable NSDate *)lastYear;
- (nullable NSDate *)nextYear;

- (nullable NSDate *)lastMonth;
- (nullable NSDate *)nextMonth;

- (NSDate *)lastDay;
- (NSDate *)nextDay;

@end

@interface NSDate (NSDateCompareAddtion)

- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isSameDay:(NSDate *)date;
- (BOOL)isSameMinute:(NSDate *)date;

@end

@interface NSDate (NSDateFormatAddtion)

+ (nullable NSDate *)dateFromString:(NSString *)string format:(NSString *)format;
+ (nullable NSDate *)dateFromString:(NSString *)string format:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone locale:(nullable  NSLocale *)locale;
+ (nullable NSDate *)dateFromISOFormatString:(NSString *)string;

- (nullable NSString *)stringWithFormat:(NSString *)format;
- (nullable NSString *)stringWithFormat:(NSString *)format timeZone:(nullable NSTimeZone *)timeZone locale:(nullable NSLocale *)locale;
- (nullable NSString *)stringWithISOFormat;

@end


NS_ASSUME_NONNULL_END
