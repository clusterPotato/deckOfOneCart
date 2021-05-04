//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Gavin Craft on 5/4/21.
//

import Foundation
enum CardError: LocalizedError{
    case brokenURL
    case genericWebError
    case badData
    case decodingNoWork
    var errorDescription: String?{
        switch self{
            case .brokenURL:
                return "url was broken. check it"
            case .genericWebError:
                return "there was an error"
            case .badData:
                return "bad data, possibly doesnt exist"
            case .decodingNoWork:
                return "cant decode this data, probably isnt a good sign"
            
        }
    }
}
