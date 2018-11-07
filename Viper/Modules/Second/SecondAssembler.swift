//
//  SecondAssembler.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Swinject
import SwinjectStoryboard

final class SecondAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(SecondInteractor.self) { (r, presenter: SecondPresenter) in
            let interactor = SecondInteractor()
            interactor.presenter = presenter
            interactor.apiLayer = r.resolve(ApiProtocol.self)
            return interactor
        }
        
        container.register(SecondRouter.self) { (r, view: SecondView) in
            let router = SecondRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(SecondPresenter.self) { (r, view: SecondView) in
            let presenter = SecondPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(SecondInteractor.self, argument: presenter)
            presenter.router = r.resolve(SecondRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(SecondView.self) { r, view in
            view.presenter = r.resolve(SecondPresenter.self, argument: view)
        }
    }
}
