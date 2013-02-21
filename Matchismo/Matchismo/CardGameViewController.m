//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Arvi on 2/7/13.
//  Copyright (c) 2013 ArviApps. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) NSString *flipResult;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count
                                                 usingDeck:[[PlayingCardDeck alloc]init]];
    }
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

#define MATCH_POINTS 16
#define MISMATCH_POINTS 4
#define FLIP_POINTS -1

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3:1.0;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.resultsLabel.text = self.flipResult;
    }
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    self.flipResult = [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
    self.flipCount++;
}

- (IBAction)dealPressed:(id)sender {
    self.game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count
                                                 usingDeck:[[PlayingCardDeck alloc]init]];
    self.flipCount = 0;
    self.flipResult = @"";
    [self updateUI];
}

- (IBAction)matchModePressed:(id)sender {
    UISegmentedControl* segmentControl = sender;
    NSLog(@"The card mode is %d", segmentControl.selectedSegmentIndex); //0 is 2 card, 1 is 3 card
    self.game.gameMode = segmentControl.selectedSegmentIndex;
}

@end
