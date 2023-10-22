//
//  ViewController.m
//  2023_10_19_appJuegoCartas
//
//  Created by Ivanovicx Nuñez on 19/10/23.
//

#import "ViewController.h"
#import "Model/PlayingCardDeck.h"
#import "Model/CardMatchingGame.h"

@interface ViewController ()

/*@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;*/
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

@implementation ViewController

/*- (Deck *) deck {
    
    if(!_deck)
        _deck = [self createDeck];
    
    return _deck;
}*/

- (CardMatchingGame *) game {
    
    if(!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}

- (Deck *) createDeck {
    
    return [[PlayingCardDeck alloc] init];
}

/*- (void) setFlipCount:(int)flipCount {
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}*/

- (IBAction)touchCardButton:(UIButton *)sender {
    
    /*if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"Back-card-itl_tree"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        //Card *randomCard = [self.deck.drawRandomCard];
        Card *randomCard = [self.deck drawRandomCard];
        
        if(randomCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"Blank-card"] forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
        
    }*/
    
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    //self.flipCount++;
}

- (void) updateUI {
    
    for(UIButton *cardButton in self.cardButtons){
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    }
}

- (NSString *) titleForCard:(Card *) card {
    
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card {
    
    return [UIImage imageNamed:card.isChosen ? @"Blank-card" : @"Back-card-itl_tree"];
}

@end
