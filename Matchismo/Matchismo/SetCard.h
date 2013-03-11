//
//  SetCard.h
//  Matchismo
//
//  Created by Arvi S Punzalan on 3/10/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *shape; //may need to be an attributed string
@property (nonatomic) NSUInteger count;

+ (NSArray *) validShapes;
+ (NSArray *) validColor;
+ (NSUInteger)maxCount;

@end
