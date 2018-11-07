//
//  SecondPresenter.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Foundation

final class SecondPresenter: SecondViewOutput {
    
    weak var view: SecondViewInput!
    var interactor: SecondInteractorInput!
    var router: SecondRouterInput!

    init() {
        #if DEBUG
            print("SecondPresenter init()")
        #endif
    }
    
    func goBack() {
        self.router.openBack()
    }
    
}

extension SecondPresenter: SecondInteractorOutput {
    
}
