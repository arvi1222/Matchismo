//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/14/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "PlayingCardGameViewController.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (void)updateCardButton:(UIButton *)cardButton withCard:(Card *)card
{
    UIImage *cardBackImage = [UIImage imageNamed:@"card_back.jpeg"];
    [cardButton setTitle:card.contents forState:UIControlStateSelected];
    [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
    cardButton.selected = card.isFaceUp;
    if (!cardButton.isSelected)[cardButton setImage:cardBackImage forState:UIControlStateNormal];
    else [cardButton setImage:nil forState:UIControlStateNormal];
    cardButton.enabled = !card.isUnplayable;
    cardButton.alpha = card.isUnplayable ? 0.3:1.0;
}

- (Deck *)makeCardDeck
{
    Deck *deck = [[PlayingCardDeck alloc]init];
    return deck;
}

#define MATCH_BONUS_2 4
#define MATCH_BONUS_3 9
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (NSString *)makeFlipResultString:(NSString*) flipResults
{
    NSString *result = @"";
    if ([flipResults isEqualToString: @"Match"]) {
        result = [NSString stringWithFormat:@"Matched %@ & %@ for %d points.", super.game.cards[0].contents, super.game.cards[1].contents, matchScore * MATCH_BONUS_2];
    }
}

@end
