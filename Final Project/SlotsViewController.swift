//
//  SlotsViewController.swift
//  Final Project
//
//  Created by oliver naser on 12/3/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//

import UIKit
import AVFoundation

class SlotsViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    var balance : Int!
    
    @IBOutlet weak var slotOne: UIImageView!
    @IBOutlet weak var slotTwo: UIImageView!
    @IBOutlet weak var slotThree: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var currentBalanceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(balance)")
       updateCurrentBalanceLabel()
    }
    
    func updateCurrentBalanceLabel() {
        currentBalanceLabel.text = String(balance)
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
    
    func animateSlotOne() {
       
        let bounds = self.slotOne.bounds
        let shrinkValue: CGFloat = 60
        self.slotOne.bounds = CGRect(
            x: self.slotOne.bounds.origin.x + shrinkValue,
            y: self.slotOne.bounds.origin.y + shrinkValue, width: self.slotOne.bounds.size.width - shrinkValue, height: self.slotOne.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { self.slotOne.bounds = bounds }, completion: nil)
    }
    
    func animateSlotTwo() {
        
        let bounds = self.slotTwo.bounds
        let shrinkValue: CGFloat = 60
        self.slotTwo.bounds = CGRect(
            x: self.slotTwo.bounds.origin.x + shrinkValue,
            y: self.slotTwo.bounds.origin.y + shrinkValue, width: self.slotTwo.bounds.size.width - shrinkValue, height: self.slotTwo.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { self.slotTwo.bounds = bounds }, completion: nil)
    }
    
    func animateSlotThree() {
        
        let bounds = self.slotThree.bounds
        let shrinkValue: CGFloat = 60
        self.slotThree.bounds = CGRect(
            x: self.slotThree.bounds.origin.x + shrinkValue,
            y: self.slotThree.bounds.origin.y + shrinkValue, width: self.slotThree.bounds.size.width - shrinkValue, height: self.slotThree.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { self.slotThree.bounds = bounds }, completion: nil)
    }
    
    
   

    @IBAction func slotRolled(_ sender: Any) {
        var slotRandomOne = arc4random_uniform(3)
        var slotRandomTwo = arc4random_uniform(3)
        var slotRandomThree = arc4random_uniform(3)
        
        var BCLogoCount = 0
        var sevenCount = 0
        var letterXCount = 0
        
        switch slotRandomOne {
        case 0:
            slotOne.image = UIImage(named:"BCLogo")
            BCLogoCount += 1
        case 1:
           slotOne.image = UIImage(named: "seven")
            sevenCount += 1
        case 2:
            slotOne.image = UIImage(named:"letterX")
            letterXCount += 1
        default:
           print("whoops")
        }
        
        switch slotRandomTwo {
        case 0:
            slotTwo.image = UIImage(named:"BCLogo")
            BCLogoCount += 1
            
        case 1:
            slotTwo.image = UIImage(named: "seven")
            sevenCount += 1
        case 2:
            slotTwo.image = UIImage(named:"letterX")
            letterXCount += 1
        default:
            print("whoops")
        }
        
        switch slotRandomThree {
        case 0:
            slotThree.image = UIImage(named:"BCLogo")
            BCLogoCount += 1
        case 1:
            slotThree.image = UIImage(named: "seven")
            sevenCount += 1
        case 2:
            slotThree.image = UIImage(named:"letterX")
            letterXCount += 1
        default:
            print("whoops")
        }
        
        if BCLogoCount == 2 {
            resultsLabel.text = "Congrats, you won 3 coins"
            balance = balance + 3
        playSound(soundName: "appluaseSound", audioPlayer: &audioPlayer)
            
        } else if BCLogoCount == 3 {
            resultsLabel.text = "Congrats, you won 8 coins"
            balance = balance + 8
            playSound(soundName: "appluaseSound", audioPlayer: &audioPlayer)
            animateSlotOne()
            animateSlotTwo()
            animateSlotThree()
        }
        
        if sevenCount == 2 {
            resultsLabel.text = "Congrats, you won 1 coin"
            balance = balance + 1
            playSound(soundName: "appluaseSound", audioPlayer: &audioPlayer)
         
        } else if sevenCount == 3 {
            resultsLabel.text = "Jackpot!!! 20 Coins!!!"
            balance = balance + 20
           playSound(soundName: "jackpotSound", audioPlayer: &audioPlayer)
            animateSlotOne()
            animateSlotTwo()
            animateSlotThree()
        }
        
        if sevenCount == 1 && BCLogoCount == 1 && letterXCount == 1 {
            resultsLabel.text = "try again!"
            
        
        } else if letterXCount == 2 {
            resultsLabel.text = "Tough luck, -10 coin!"
            balance = balance - 10
            playSound(soundName: "loseSound", audioPlayer: &audioPlayer)
            
        } else if letterXCount == 3 {
            resultsLabel.text = "Ouch! -25 coins!"
            balance = balance - 25
            playSound(soundName: "loseSound", audioPlayer: &audioPlayer)
        }
    
        letterXCount = 0
        sevenCount = 0
        BCLogoCount = 0
        updateCurrentBalanceLabel()
       
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! BalanceVC
        destination.balance = balance
    }
    
}
