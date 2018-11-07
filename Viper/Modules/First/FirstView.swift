//
//  FirstView.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import UIKit

protocol FirstModuleInput: class {
    func configure()
}

protocol FirstViewInput: class {
    func updateItemsList(items:[Item])
}

protocol FirstViewOutput: class {
    func viewIsReady()
    func openItem(item:Item)
}

final class FirstView: UIViewController, FirstViewInput {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FirstViewOutput!
    
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    func updateItemsList(items:[Item]) {
        self.items = items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.presenter.viewIsReady()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension FirstView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        self.presenter.openItem(item: item)
    }
    
}

extension FirstView: FirstModuleInput {
    func configure() {        
        
    }
}
