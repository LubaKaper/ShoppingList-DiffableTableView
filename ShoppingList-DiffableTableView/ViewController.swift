//
//  ViewController.swift
//  ShoppingList-DiffableTableView
//
//  Created by Liubov Kaper  on 7/15/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private var dataSource: DataSource! // sublclass of created

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureDataSource()
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditState))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddVC))
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableview, indexpath, item) -> UITableViewCell? in
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
            cell.textLabel?.text = "\(item.name)"
            return cell
        })
        
        dataSource.defaultRowAnimation = .fade
        // setup initial snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Category, Item>()
        
        // populate snapshot with sections and items for each section
        // CaseIterable allows us to iterate through all cases of enum Category
        for category in Category.allCases {
            // query the testData items for that particular category's items
            let items = Item.testData().filter {$0.category == category}
            snapshot.appendSections([category])
            snapshot.appendItems(items)
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc private func toggleEditState(){
        
    }
    @objc private func presentAddVC(){
        // TODO:
        // create a AdditemViewController.swift file
        // add a viewController object in StoryBoard
        // add 2 text fields: item name, item price
        // add a picker view to manage categories
        // user is able to add new item to shopping list
        // use any communication protocol to get data from Add ItemVC to VC
        // types of communications: delegate, KVO, notification center, unwind segue, callback, combine
        
        guard let addItemVC = storyboard?.instantiateViewController(identifier: "addItemVC") as? AddItemViewController else {
            return
        }
        
        present(addItemVC, animated: true)
    }

}

