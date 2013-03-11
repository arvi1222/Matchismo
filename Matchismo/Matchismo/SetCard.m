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

- (NSAttributedString *)contents //need to finish
{
    return [[NSAttributedString alloc] initWithString:@"finish me"];
}

@synthesize shape = _shape;

+ (NSArray *)validShapes //need to finish
{
    static NSArray *validShapes = nil;
    if (!validShapes) validShapes = @[@"square"];
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

+ (NSArray *)validColor //need to finish
{
    static NSArray *validColor = nil;
    if (!validColor) validColor = @[@"square"];
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

- (void)setCount:(NSUInteger)count
{
    if (count <= [SetCard maxCount]) _count = count;
}

@end
