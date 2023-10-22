//
//  Card.m
//  2023_10_19_appJuegoCartas
//
//  Created by Ivanovicx Nuñez on 19/10/23.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize contents = _contents;
@synthesize chosen = _chosen;
@synthesize matched = _matched;

- (NSString *) contents {
    return _contents;
}

- (void) setContents:(NSString *)contents {
    _contents = contents;
}

- (BOOL) isChosen {
    return _chosen;
}

- (void) setChosen:(BOOL)chosen {
    _chosen = chosen;
}

- (BOOL) isMatched {
    return _matched;
}

- (void) setMatched:(BOOL)matched {
    _matched = matched;
}

/*- (int) match: (Card *) card {
    int score = 0;
    if([card.contents isEqualToString:self.contents])
        score = 1;
    
    return score;
}*/

- (int) match:(NSArray *) otherCards {
    
    int score = 0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
}

@end
