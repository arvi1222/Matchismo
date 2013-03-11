//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/11/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init
{
    self = [super init];
    
    if (self) {
        for (NSString *shape in [SetCard validShapes]) {
            for (NSString *color in [SetCard validColor]) {
                for (int i = 0; i<=[SetCard maxCount]; i++) {
                    SetCard *card = [[SetCard alloc]init];
                    card.count = [NSNumber numberWithInt:i];
                    card.color = color;
                    card.shape = shape;
                    [self addCard: card atTop:YES];
                }
            }
        }
    }
    
    return self;
}


@end
