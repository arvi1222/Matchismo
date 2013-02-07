//
//  PlayingCard.h
//  Matchismo
//
//  Created by Arvi on 2/7/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
