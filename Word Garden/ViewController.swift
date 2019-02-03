//
//  ViewController.swift
//  Word Garden
//
//  Created by Christopher Donnelly on 1/31/19.
//  Copyright © 2019 Chris Donnelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Is guessLetterField the firstResponder?",guessedLetterField.isFirstResponder)
    }

    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        print("guessLetterField changed")
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
        print("Is guessLetterField the firstResponder?",guessedLetterField.isFirstResponder)
    }
}

