//
//  Pet.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import Foundation

class Pet: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var image:String
    var gender:String
    var species:String
    var breed:String
    var age:String
    var adoptionFee:Int
    var featured:Bool
    
}
