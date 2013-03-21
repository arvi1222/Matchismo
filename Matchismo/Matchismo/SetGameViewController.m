//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/6/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "SetGameViewController.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (void)updateCardButton:(UIButton *)cardButton withCard:(Card *)card
{
    
}

- (Deck *)makeCardDeck
{
    Deck *deck = [[SetCardDeck alloc]init]; //implement setCardDeck
    return deck;
}


 
- (NSAttributedString *)makeResultString:(NSString *)flipResult
{
    return nil;
}
 


@end
