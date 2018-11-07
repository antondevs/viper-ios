//
//  SecondRouter.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import LightRoute

protocol SecondRouterInput: class {
    func openNext()
    func openBack()
}

final class SecondRouter: SecondRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openNext() {
        //  let storyboard = UIStoryboard(name: "{NAME}", bundle: Bundle.main)
        //  let factory = StoryboardFactory(storyboard: storyboard)
        //  
        //  try? transitionHandler
        //     .forStoryboard(factory: factory, to: {NAME}View.self)
        //      .transition(animate: false)
        //      .then { moduleInput in
        //          moduleInput.configure()
        //  }
    }
    
    func openBack() {
        try? transitionHandler
            .closeCurrentModule()
            .perform()
    }
    
}
