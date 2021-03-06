//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Arvi on 2/7/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCard.h"
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)makeCardDeck;
- (void)updateCardButton:(UIButton *)cardButton withCard:(Card *)card;

@end
