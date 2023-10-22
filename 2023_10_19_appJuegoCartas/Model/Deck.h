//
//  Deck.h
//  2023_10_19_appJuegoCartas
//
//  Created by Ivanovicx Nuñez on 19/10/23.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

- (void) addCard:(Card *) card atTop:(BOOL) atTop;
- (void) addCard:(Card *) card;
- (Card *) drawRandomCard;

@end

NS_ASSUME_NONNULL_END
