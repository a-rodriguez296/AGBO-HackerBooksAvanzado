//
//  NSString+Category.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/23/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (NSString*)returnBetweenString:(NSString *)inString1
                       andString:(NSString *)inString2
{
    NSRange substringRange = [self rangeBetweenString:inString1
                                            andString:inString2];
    return [self substringWithRange:substringRange];
}


- (NSRange) rangeBetweenString:(NSString *)inString1 andString:(NSString *)inString2
{
    return [self rangeBetweenString:inString1 andString:inString2 options:0];
}

- (NSRange) rangeBetweenString:(NSString *)inString1 andString:(NSString *)inString2
                       options:(unsigned)inMask
{
    return [self rangeBetweenString:inString1 andString:inString2
                            options:inMask
                              range:NSMakeRange(0,[self length])];
}

- (NSRange) rangeBetweenString:(NSString *)inString1 andString:(NSString *)inString2
                       options:(unsigned)inMask range:(NSRange)inSearchRange
{
    NSRange result;
    unsigned int foundLocation = inSearchRange.location;    // if no start string, start here
    NSRange stringEnd = NSMakeRange(NSMaxRange(inSearchRange),0); // if no end string, end here
    NSRange endSearchRange;
    if (nil != inString1)
    {
        // Find the range of the list start
        NSRange stringStart = [self rangeOfString:inString1 options:inMask range:inSearchRange];
        if (NSNotFound == stringStart.location)
        {
            return stringStart; // not found
        }
        foundLocation = NSMaxRange(stringStart);
    }
    endSearchRange = NSMakeRange( foundLocation, NSMaxRange(inSearchRange) - foundLocation );
    if (nil != inString2)
    {
        stringEnd = [self rangeOfString:inString2 options:inMask range:endSearchRange];
        if (NSNotFound == stringEnd.location)
        {
            return stringEnd;   // not found
        }
    }
    result = NSMakeRange( foundLocation, stringEnd.location - foundLocation );
    return result;
}
@end
