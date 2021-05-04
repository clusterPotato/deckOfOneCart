//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Gavin Craft on 5/4/21.
//

import UIKit
class CardController{
    static let urlOfBase = URL(string: "https://deckofcardsapi.com/api/deck/new")
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void){
        guard let urlOfBase = urlOfBase else {return completion(.failure(.brokenURL))}
        let finalURL = urlOfBase.appendingPathComponent("draw")
        //let finalURL = secondUrl.appendingPathComponent("?count=1")
        //since max asked so nicely
        print(finalURL)
        //data task
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error{
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.genericWebError))
            }
            guard let data = data else {return completion(.failure(.badData))}
            do{
                print(String(data:data, encoding: .utf8))
                let deck = try JSONDecoder().decode(Deck.self, from: data)
                let card = deck.cards[0]
                completion(.success(card))
            }catch{
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.decodingNoWork))
            }
        }.resume()
    }
    static func fetchImage(_ url: URL, completion: @escaping(Result<UIImage, CardError>) -> Void){
        //since max so politely asked
        print(url)
        //DATA TASHK
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.brokenURL))
            }
            guard let data = data else {return completion(.failure(.badData))}
            guard let image = UIImage(data: data) else {return completion(.failure(.decodingNoWork))}
            completion(.success(image))
        }.resume()
    }
}
