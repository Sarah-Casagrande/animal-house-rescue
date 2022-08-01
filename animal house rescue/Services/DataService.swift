//
//  DataService.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//
import Foundation

class DataService {
    
    static func getLocalData() -> [Pet] {
        
        let pathString = Bundle.main.path(forResource: "pets", ofType: "json")
        
        guard pathString != nil else {
            return [Pet]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let petData = try decoder.decode([Pet].self, from: data)
                
                // Add the unique IDs
                for pet in petData {
                    pet.id = UUID()
                }
                
                // Return the recipes
                return petData
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        return [Pet]()
    }
    
}
