//
//  ItemStore.swift
//  LootLogger
//
//  Created by Xiaochun Shen on 2020/5/12.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() ->
        Item {
            let newItem = Item(random: true)
            allItems.append(newItem)
            
            return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
}