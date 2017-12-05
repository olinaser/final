//
//  DiceViewController.swift
//  Final Project
//
//  Created by oliver naser on 12/3/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//

import UIKit
import AVFoundation

class DiceViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    var balance : Int!
   
    
    @IBOutlet weak var numberEnter: UITextField!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    var originalImageBounds: CGRect!
    var originalImageFrame: CGRect!
    var originalViewCenterX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(balance)")
        currentBalanceLabel.text = "\(balance!)"
        originalImageBounds = diceImage.bounds
        originalImageFrame = diceImage.frame
        originalViewCenterX = self.view.center.x
    }

    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load datea from file \(soundName)")
        }
    }
    
    func animateDice() {
        
        let bounds = self.diceImage.bounds
        let shrinkValue: CGFloat = 60
        self.diceImage.bounds = CGRect(
            x: self.diceImage.bounds.origin.x + shrinkValue,
            y: self.diceImage.bounds.origin.y + shrinkValue, width: self.diceImage.bounds.size.width - shrinkValue, height: self.diceImage.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { self.diceImage.bounds = bounds }, completion: nil)
    }
    
    
    @IBAction func onePressed(_ sender: Any) {
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 1 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
             balance = balance + 50
            animateDice()
           
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
        
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 2 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
            balance = balance + 50
            animateDice()
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
    }
    
    @IBAction func threePressed(_ sender: Any) {
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 3 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
            balance = balance + 50
            animateDice()
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 4 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
            balance = balance + 50
            animateDice()
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 5 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
            balance = balance + 50
            animateDice()
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
    }
    
    @IBAction func sixPressed(_ sender: Any) {
        var roll = arc4random_uniform(6)+1
        diceImage.image = UIImage(named:"\(roll)")
        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
        if roll == 6 {
            resultsLabel.text = "Congrats! You have won 50 Coins!"
            balance = balance + 50
            animateDice()
        } else {
            resultsLabel.text = "Uh oh! You have lost 10 Coins!"
            balance = balance - 10
        }
        currentBalanceLabel.text = "\(balance!)"
    }
    
    
    
//    @IBAction func numberEnterAction(_ sender: Any) {
//        var roll = arc4random_uniform(6)+1
//        diceImage.image = UIImage(named:"\(roll)")
//        playSound(soundName: "diceRollSound", audioPlayer: &audioPlayer)
//
//
//        if numberEnter.text == "\(roll)" {
//            resultsLabel.text = "congrats"
//            balance = balance + 50
//        } else {
//            resultsLabel.text = "sorry"
//            balance = balance - 10
//        }
//
//        print("\(balance)")
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! BalanceVC
        destination.balance = balance
    }
    
    

}
