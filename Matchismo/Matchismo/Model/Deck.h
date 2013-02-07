//
//  Deck.h
//  Matchismo
//
//  Created by Arvi on 2/7/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
