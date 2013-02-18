//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Arvi on 2/16/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

- (NSString *)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
