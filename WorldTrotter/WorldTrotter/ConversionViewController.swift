//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Xiaochun Shen on 2020/5/7.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }


    @IBAction func fahreheitFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}

