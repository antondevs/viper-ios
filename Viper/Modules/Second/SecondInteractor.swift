//
//  SecondInteractor.swift
//  Viper
//
//  Created Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

protocol SecondInteractorOutput: class {
    
}

protocol SecondInteractorInput: class {
   
}

final class SecondInteractor: SecondInteractorInput {

    weak var presenter: SecondInteractorOutput!

	var apiLayer: ApiProtocol!    

}

