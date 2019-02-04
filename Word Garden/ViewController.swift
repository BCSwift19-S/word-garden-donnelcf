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
    
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
    }

    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        
        let currentLetterGuess = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuess){
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage.init(named: "flower\(wrongGuessesRemaining)")
            let guess = ((maxNumberOfWrongGuesses-wrongGuessesRemaining) == 1 ? "Guess": "Guesses")
            guessCountLabel.text = "You Made \(maxNumberOfWrongGuesses-wrongGuessesRemaining) Wrong \(guess)"
        }
        
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            guessCountLabel.text = "You Lost the Game"
            playAgainButton.isHidden = false
            guessLetterButton.isEnabled = false
            guessedLetterField.isEnabled = false
        } else if !revealedWord.contains("_"){
            guessCountLabel.text = "You Won the Game!"
            playAgainButton.isHidden = false
            guessLetterButton.isEnabled = false
            guessedLetterField.isEnabled = false
        }
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
        guessedLetterField.isEnabled = true
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        flowerImageView.image = UIImage.init(named: "flower\(wrongGuessesRemaining)")
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You Made 0 Guesses"
    }
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            guessLetterButton.isEnabled = false
        }
        
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    
}

