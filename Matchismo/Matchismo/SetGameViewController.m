//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/6/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "SetGameViewController.h"

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;


@end

@implementation SetGameViewController

- (void)updateCardButton:(UIButton *)cardButton withCard:(Card *)card
{
    //not sure if this is correct
    
    [cardButton setTitle:card.contents forState:UIControlStateSelected];
    [cardButton setTitle:card.contents forState:UIControlStateNormal];
    cardButton.selected = card.isFaceUp;
    if (!cardButton.isSelected) cardButton.alpha = 0.3;
    cardButton.enabled = !card.isUnplayable;
    cardButton.alpha = card.isUnplayable ? 0.0:1.0;
     
    
}

- (Deck *)makeCardDeck
{
    Deck *deck = [[SetCardDeck alloc]init];
    return deck;
}


 
- (NSAttributedString *)makeResultString:(NSString *)flipResult
{
    return nil;
}
 


@end
