//
//  Mood.swift
//  Mandala
//
//  Created by Xiaochun Shen on 2020/5/17.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

struct Mood {
    var name: String
    var imgae: UIImage
    var color: UIColor
}

extension Mood {
    static let angry = Mood(name: "angry", imgae: UIImage(resource: .angry), color: UIColor.angry)
    static let confused = Mood(name: "confused", imgae: UIImage(resource: .confused), color: UIColor.confused)
    static let crying = Mood(name: "crying", imgae: UIImage(resource: .crying), color: UIColor.crying)
    static let goofy = Mood(name: "goofy", imgae: UIImage(resource: .goofy), color: UIColor.goofy)
    static let happy = Mood(name: "happy", imgae: UIImage(resource: .happy), color: UIColor.happy)
    static let meh = Mood(name: "meh", imgae: UIImage(resource: .meh), color: UIColor.meh)
    static let sad = Mood(name: "sad", imgae: UIImage(resource: .sad), color: UIColor.sad)
    static let sleepy = Mood(name: "sleepy", imgae: UIImage(resource: .sleepy), color: UIColor.sleepy)
    
}
