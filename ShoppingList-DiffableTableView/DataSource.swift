//
//  DataSource.swift
//  ShoppingList-DiffableTableView
//
//  Created by Liubov Kaper  on 7/15/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit


// conforms to UITableViewDataSource
class DataSource: UITableViewDiffableDataSource<Category, Item> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if Category.allCases[section] == .shoppingCart {
            return "🛒" + Category.allCases[section].rawValue
        } else {
        
        return Category.allCases[section].rawValue
        }
    }
}
