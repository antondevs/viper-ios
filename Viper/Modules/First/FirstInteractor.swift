//
//  FirstInteractor.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

protocol FirstInteractorOutput: class {
    
}

protocol FirstInteractorInput: class {
   func loadList(completion: @escaping ([Item])->())
}

final class FirstInteractor: FirstInteractorInput {

    weak var presenter: FirstInteractorOutput!

	var apiLayer: ApiProtocol!
    
    func loadList(completion: @escaping ([Item])->()) {
        apiLayer.loadList(completion: completion)
    }

}

