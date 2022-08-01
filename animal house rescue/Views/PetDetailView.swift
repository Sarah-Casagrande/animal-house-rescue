//
//  PetDetailView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import SwiftUI

struct PetDetailView: View {

    var pet:Pet
    
    var body: some View {
        
        ScrollView() {
            
            Image(pet.image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading) {
                
                Text(pet.name)
                    .bold()
                    .padding(.vertical, 10)
                    .font(.largeTitle)
                
                Text(pet.age + " | " + pet.gender + " | " + pet.breed)
                    .padding(.bottom, 20)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")
                    .padding(.bottom, 30)
                
                Button {
                    print("Adopt Me!")
                } label: {
                    Text("Adopt Me!")
                        .bold()
                    
                }
                .padding(20)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(30.0)
                
                Text("View Related Pets")
                    .bold()
                    .padding(.top, 30)
                
//                HStack {
//                    ForEach (0..<model.pets.count) { pet in
//
//                            Image(pet.image)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 50, height: 50, alignment: .center)
//                                .clipped()
//                                .cornerRadius(5)
//
//                    }
//                }
                
                
            }
            .padding([.leading, .bottom, .trailing])
            
        }
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = PetModel()
        PetDetailView(pet: model.pets[1])
    }
}
