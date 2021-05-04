//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by Gavin Craft on 5/4/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - iboutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - properties
    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - actions of ib
    @IBAction func drawwButtonPressed(_ sender: Any) {
        CardController.fetchCard { result in
            DispatchQueue.main.async {
                switch result{
                case .failure(let err):
                    self.presentErrorToUser(localizedError: err)
                case .success(let card):
                    self.nameLabel.text = "\(card.value) of \(card.suit)"
                    CardController.fetchImage(card.image) { imageResult in
                        DispatchQueue.main.async {
                            switch imageResult{
                            case .success(let image):
                                self.imageView.image = image
                            case .failure(let err):
                                self.presentErrorToUser(localizedError: err)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

