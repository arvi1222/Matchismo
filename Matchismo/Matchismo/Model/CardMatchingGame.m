//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Arvi on 2/16/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic)NSMutableArray *cards;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if(!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self) {
        for (int i = 0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if(!card) self =nil;
            else self.cards[i] = card;
        }
    }
    
    return self;
    
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

-(NSString *) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSString *result = @"";
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        result = [NSString stringWithFormat:@"Matched %@ & %@ for %d points.", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        result = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    break;
                }
                else result = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
    return result;
}

@end
