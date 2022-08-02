//
//  PetCarouselView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import SwiftUI

struct DogCarouselView: View {
    
    @EnvironmentObject var model:PetModel
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach (model.pets) { index in
                        
                    if index.species == "Canine" {
                        VStack {
                            Image(index.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(index.name)
                        }
                    }
                }
            }
        }
    }
}

struct CatCarouselView: View {
    
    @EnvironmentObject var model:PetModel
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach (model.pets) { index in
                        
                    if index.species == "Feline" {
                        VStack {
                            Image(index.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(index.name)
                        }
                    }
                }
            }
        }
    }
}

struct PetCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        DogCarouselView()
            .environmentObject(PetModel())
    }
}
