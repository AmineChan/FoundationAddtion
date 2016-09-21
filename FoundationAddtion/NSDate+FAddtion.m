//
//  NSDate+Addition.h
//
//
//  Created by czm on 13-9-24.
//  Copyright (c) 2013年 czm. All rights reserved.
//

#import "NSDate+FAddtion.h"

NSString *const kDateFormatISO = @"yyyy-MM-dd'T'HH:mm:ssZ";
NSString *const kDateFormat_yyyyMMdd_joinedByDot = @"yyyy.MM.dd";
NSString *const kDateFormat_yyyyMMdd_joinedByMinus = @"yyyy-MM-dd";
NSString *const kDateFormat_yyyyMMdd_joinedByVirgule = @"yyyy/MM/dd";
NSString *const kDateFormat_yyyyMMdd_joinedByChinese = @"yyyy年MM月dd日";

@implementation NSDate (NSDateAddtion)

+ (NSDateFormatter *)ISOFormatter
{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        formatter.dateFormat = kDateFormatISO;
    });
    
    return formatter;
}

- (NSCalendar *)calendar
{
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    
    return [NSCalendar currentCalendar];
}

- (NSInteger)year
{
    return [[[self calendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month
{
    return [[[self calendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day
{
    return [[[self calendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour
{
    return [[[self calendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute
{
    return [[[self calendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second
{
    return [[[self calendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)weekday
{
    return [[[self calendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal
{
    return [[[self calendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth
{
    return [[[self calendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear
{
    return [[[self calendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear
{
    return [[[self calendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter
{
    return [[[self calendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (NSUInteger)numberOfDaysInCurrentMonth
{
    NSRange range = [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

@end

@implementation NSDate (NSDateChangeAddtion)

- (NSDate *)addingYears:(NSUInteger)years
{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear fromDate:self];
    [comp setYear:years];
    
    return [calendar dateByAddingComponents:comp toDate:self options:0];
}

- (NSDate *)addingMonths:(NSUInteger)months
{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitMonth fromDate:self];
    [comp setMonth:months];
    
    return [calendar dateByAddingComponents:comp toDate:self options:0];
}

- (NSDate *)addingDays:(NSUInteger)days
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
}

- (NSDate *)addingHours:(NSUInteger)hours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
}

- (NSDate *)addingMinutes:(NSUInteger)minutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
}

- (NSDate *)addingSeconds:(NSUInteger)seconds
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
}

- (NSDate *)lastDay
{
    return [self addingDays:-1];
}

- (NSDate *)nextDay
{
    return [self addingDays:1];
}

- (NSDate *)lastMonth
{
    return [self addingMonths:-1];
}

- (NSDate *)nextMonth
{
    return [self addingMonths:1];
}

- (NSDate *)lastYear
{
    return [self addingYears:-1];
}

- (NSDate *)nextYear
{
    return [self addingYears:1];
}

@end

@implementation NSDate (NSDateCompareAddtion)

- (BOOL)isToday
{
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24)
        return NO;
    
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday
{
    return [[self addingDays:1] isToday];
}

- (BOOL)isSameDay:(NSDate *)date
{
    assert(date);
    
    NSCalendar *calendar = [self calendar];
    unsigned unitFlag = (NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay);
    NSDateComponents *comp = [calendar components:unitFlag fromDate:self];
    NSDateComponents *otherComp = [calendar components:unitFlag fromDate:date];
    NSDate *thisDate = [calendar dateFromComponents:comp];
    NSDate *otherDate = [calendar dateFromComponents:otherComp];
    
    if([thisDate isEqualToDate:otherDate])
        return YES;
    
    return NO;
}

- (BOOL)isSameMinute:(NSDate *)date
{
    assert(date);
    
    NSCalendar *calendar = [self calendar];
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:self];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date];
    return (([comp1 day] == [comp2 day])
            && ([comp1 month] == [comp2 month])
            && ([comp1 year] == [comp2 year])
            && ([comp1 hour] == [comp2 hour])
            && ([comp1 minute] == [comp2 minute]));
}

@end

@implementation NSDate (NSDateFormatAddtion)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    assert(string&&format);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];

    return [formatter dateFromString:string];
}

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    assert(string&&format);

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone)
        [formatter setTimeZone:timeZone];
    if (locale)
        [formatter setLocale:locale];
    
    return [formatter dateFromString:string];
}

+ (NSDate *)dateFromISOFormatString:(NSString *)string
{
    return [[NSDate ISOFormatter] dateFromString:string];
}

- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];

    return [formatter stringFromDate:self];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone)
        [formatter setTimeZone:timeZone];
    if (locale)
        [formatter setLocale:locale];
    
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithISOFormat
{
    return [[NSDate ISOFormatter] stringFromDate:self];
}

@end

