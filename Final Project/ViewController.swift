//
//  ViewController.swift
//  Final Project
//
//  Created by oliver naser on 12/4/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var balance = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! BalanceVC
        destination.balance = balance
    }

}
