//
//  PetModel.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import Foundation

class PetModel: ObservableObject {
    
    @Published var pets = [Pet]()
    
    init() {
        // Create an instance of data service and get data
        self.pets = DataService.getLocalData()
    }
}
