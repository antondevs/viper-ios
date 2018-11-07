//
//  FirstPresenter.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Foundation

final class FirstPresenter: FirstViewOutput {
    
    weak var view: FirstViewInput!
    var interactor: FirstInteractorInput!
    var router: FirstRouterInput!
    
    var items:[Item] = []

    init() {
        #if DEBUG
            print("FirstPresenter init()")
        #endif
    }
    
    func viewIsReady() {
        self.interactor.loadList { (result) in
            self.items = result
            self.view.updateItemsList(items: self.items)
        }
    }

    func openItem(item:Item) {
        self.router.openSecond(item: item)
    }
    
}

extension FirstPresenter: FirstInteractorOutput {
    
}
