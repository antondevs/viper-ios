//
//  SecondView.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import UIKit

protocol SecondModuleInput: class {
    func configure(item:Item)
}

protocol SecondViewInput: class {
    
}

protocol SecondViewOutput: class {
    func goBack()
}

final class SecondView: UIViewController, SecondViewInput {

    @IBOutlet weak var labelName: UILabel!
    
    var presenter: SecondViewOutput!
    var item:Item = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = item.name
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.presenter.goBack()
    }
    
}

extension SecondView: SecondModuleInput {
    func configure(item:Item) {
        self.item = item
    }
}
