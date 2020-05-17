//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Xiaochun Shen on 2020/5/17.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

enum ImageResource: String {
       case angry
       case confused
       case crying
       case goofy
       case happy
       case meh
       case sad
       case sleepy
   }
   

extension UIImage {
    
    convenience init(resource: ImageResource) {
        self.init(named: resource.rawValue)!
    }
   
}
