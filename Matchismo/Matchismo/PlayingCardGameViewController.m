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

@end
