//
//  PlayingCard.m
//  Matchismo
//
//  Created by Arvi on 2/7/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([self.suit isEqualToString:otherCard.suit]) score = 1;
        else if (self.rank == otherCard.rank) score = 4;
    }
    
    //need to implement if (otherCards.count == 2)
    if (otherCards.count == 2) {
        PlayingCard *otherCard1 = otherCards[0];
        PlayingCard *otherCard2 = otherCards[1];
        if ([self.suit isEqualToString:otherCard1.suit] && [self.suit isEqualToString:otherCard2.suit]) score = 3;
        else if (self.rank == otherCard1.rank && self.rank == otherCard2.rank) score = 12;
    }
    
    return score;
}

- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    return validSuits;
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    static NSArray *rankStrings = nil;
    if (!rankStrings) rankStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return rankStrings;
}

+ (NSUInteger)maxRank { return [self rankStrings].count - 1; }

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank =rank;
    }
}

@end
