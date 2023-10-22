//
//  ViewController.m
//  2023_10_19_appJuegoCartas
//
//  Created by Ivanovicx Nuñez on 19/10/23.
//

#import "ViewController.h"
#import "Model/PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (strong, nonatomic) Deck *deck;

@end

@implementation ViewController

- (Deck *) deck {
    
    if(!_deck)
        _deck = [self createDeck];
    
    return _deck;
}

- (Deck *) createDeck {
    
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount {
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"Back-card-itl_tree"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        //Card *randomCard = [self.deck.drawRandomCard];
        Card *randomCard = [self.deck drawRandomCard];
        
        if(randomCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"Blank-card"] forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
        
    }
    
    self.flipCount++;
}


@end
