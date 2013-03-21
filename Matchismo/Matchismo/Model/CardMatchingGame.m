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
@property (strong, nonatomic)NSMutableArray *flippedCards;
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

- (NSMutableArray *) flippedCards
{
    if(!_flippedCards) {
        _flippedCards = [[NSMutableArray alloc]init];
    }
    return _flippedCards;
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

#define MATCH_BONUS_2 4
#define MATCH_BONUS_3 9
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
#define TWO_CARD_MODE 0
#define THREE_CARD_MODE 1

-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    //NSString *result = @"";
    
    if (self.gameMode == TWO_CARD_MODE) {
        if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS_2;
                        self.flipCardResult = [NSString stringWithFormat:@"Matched %@ & %@ for %d points.", card.contents, otherCard.contents, matchScore * MATCH_BONUS_2];
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.flipCardResult = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    break;
                }
                else self.flipCardResult = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
    } else if (self.gameMode == THREE_CARD_MODE) {
        if (!card.isUnplayable) {
            if (!card.isFaceUp) {
                if (self.flippedCards.count == 2) {
                    int matchScore = [card match:self.flippedCards];
                    if (matchScore) {
                        Card *matchedCard1 = self.flippedCards[0];
                        Card *matchedCard2 = self.flippedCards[1];
                        matchedCard1.unplayable = YES;
                        matchedCard2.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS_3;
                        self.flipCardResult = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points.", card.contents, matchedCard1.contents, matchedCard2.contents, matchScore * MATCH_BONUS_3];
                        [self.flippedCards removeAllObjects];
                    }
                    else {
                        for (Card *matchedCard in self.flippedCards) matchedCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        Card *matchedCard1 = self.flippedCards[0];
                        Card *matchedCard2 = self.flippedCards[1];
                        self.flipCardResult = [NSString stringWithFormat:@"%@, %@ and %@ don't match! %d point penalty!", card.contents, matchedCard1.contents, matchedCard2.contents, MISMATCH_PENALTY];
                        [self.flippedCards removeAllObjects];
                        [self.flippedCards addObject:card];
                    }
                }
                else {
                    self.flipCardResult = [NSString stringWithFormat:@"Flipped up %@", card.contents];
                    [self.flippedCards addObject:card];
                }
                
                self.score -= FLIP_COST;
            }
            else [self.flippedCards removeObject:card];
            card.faceUp = !card.isFaceUp;
        }
    }
    //return result;
}

@end
