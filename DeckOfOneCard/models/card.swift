//
//  card.swift
//  DeckOfOneCard
//
//  Created by Gavin Craft on 5/4/21.
//

import Foundation
struct Deck: Decodable{
    let cards: [Card]
    
}
struct Card: Decodable{
    let image: URL
    let value: String
    let suit: String
}
