//
//  ApiService.swift
//  Viper
//
//  Created by Anton Nadtoka on 07/11/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation

protocol ApiProtocol {
    func loadList(completion: @escaping ([Item])->())
}

class ApiService : ApiProtocol {
    // Some variables
    
}

// Maybe group of methods store in separate files
extension ApiService {
    func loadList(completion: @escaping ([Item])->()) {
        var items:[Item] = []
        items.append(Item(name: "Elem 1"))
        items.append(Item(name: "Elem 2"))
        items.append(Item(name: "Elem 3"))
        completion(items)
    }
}
