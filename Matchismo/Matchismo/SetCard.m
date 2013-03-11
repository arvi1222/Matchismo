//
//  SetCard.m
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/10/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "SetCard.h"

@interface SetCard ()

@end

@implementation SetCard //need to finish

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    return score;
}

- (NSDictionary *)contents //need to finish
{
    return @{@"color" : self.color, @"shape" : self.shape, @"count" : self.count, @"filled" : self.filled};
}

@synthesize shape = _shape;

+ (NSArray *)validShapes
{
    static NSArray *validShapes = nil;
    if (!validShapes) validShapes = @[@"☐", @"◯", @"△"];
    return validShapes;
}

- (void)setShape:(NSString *)shape
{
    if ([[SetCard validShapes] containsObject:shape]){
        _shape = shape;
    }
}

- (NSString *)shape
{
    return _shape ? _shape : @"?";
}

@synthesize color = _color;

+ (NSArray *)validColor
{
    static NSArray *validColor = nil;
    if (!validColor) validColor = @[@"greenColor", @"redColor", @"blueColor"];
    return validColor;
}

- (void)setColor:(NSString *)color
{
    if ([[SetCard validColor] containsObject:color]){
        _color = color;
    }
}

- (NSString *)color
{
    return _color ? _color : @"?";
}

#define MAX_COUNT 3;

+ (NSUInteger)maxCount { return MAX_COUNT; }

- (void)setCount:(NSNumber*)count
{
    if ([count intValue]  <= [SetCard maxCount]) _count = count;
}

@end
