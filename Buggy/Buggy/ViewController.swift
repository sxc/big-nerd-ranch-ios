//
//  ViewController.swift
//  Buggy
//
//  Created by Xiaochun Shen on 2020/5/11.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTapped(_ sender: UIButton){
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        // Go one step too far empty the array (notice the range change):
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
    }
}

