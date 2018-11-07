//
//  FirstAssembler.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Swinject
import SwinjectStoryboard

final class FirstAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(FirstInteractor.self) { (r, presenter: FirstPresenter) in
            let interactor = FirstInteractor()
            interactor.presenter = presenter
            interactor.apiLayer = r.resolve(ApiProtocol.self)
            return interactor
        }
        
        container.register(FirstRouter.self) { (r, view: FirstView) in
            let router = FirstRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(FirstPresenter.self) { (r, view: FirstView) in
            let presenter = FirstPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(FirstInteractor.self, argument: presenter)
            presenter.router = r.resolve(FirstRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(FirstView.self) { r, view in
            view.presenter = r.resolve(FirstPresenter.self, argument: view)
        }
    }
}
