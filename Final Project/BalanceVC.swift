//
//  BalanceVC.swift
//  Final Project
//
//  Created by oliver naser on 12/3/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//

import UIKit

class BalanceVC: UIViewController {

    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var balanceImage: UIImageView!
    
    var balance: Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(balance)")
        if let balance = balance {
            currentBalanceLabel.text = String(balance)
        }
        balanceImageFunc()
    }
    
    func balanceImageFunc() {
        if balance > 0 {
            balanceImage.image = UIImage(named:"stackOfCoins")
        } else {
            balanceImage.image = UIImage(named:"sadFace")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSlotSegue" {
            let destination = segue.destination as! SlotsViewController
            destination.balance = balance
        } else if segue.identifier == "toDiceSegue"{
        let destination = segue.destination as! DiceViewController
        destination.balance = balance
        }
       
    }
    


    
    




}
