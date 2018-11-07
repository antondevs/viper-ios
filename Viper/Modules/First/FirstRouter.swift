//
//  FirstRouter.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import LightRoute

protocol FirstRouterInput: class {
    func openSecond(item:Item)
    func openBack()
}

final class FirstRouter: FirstRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openSecond(item:Item) {
        let storyboard = UIStoryboard(name: "Second", bundle: Bundle.main)
        let factory = StoryboardFactory(storyboard: storyboard)

        try? transitionHandler
         .forStoryboard(factory: factory, to: SecondView.self)
          .transition(animate: false)
          .then { moduleInput in
            moduleInput.configure(item: item)
        }
    }
    
    func openBack() {
        try? transitionHandler
            .closeCurrentModule()
            .perform()
    }
    
}
