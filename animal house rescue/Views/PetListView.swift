//
//  ContentView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import SwiftUI

struct PetListView: View {
    
    @EnvironmentObject var model:PetModel
    @State var chooseSpecies = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("All Pets")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                Picker("Choose Species", selection: $chooseSpecies) {
                    Text("All").tag(0)
                    Text("Dogs").tag(1)
                    Text("Cats").tag(2)
                }.padding([.bottom, .trailing]).pickerStyle(SegmentedPickerStyle())
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(model.pets) { pet in
                            
                            NavigationLink(
                                destination: PetDetailView(pet: pet),
                                label: {
                                    HStack(spacing: 20.0) {
                                        Image(pet.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment: .leading) {
                                            Text(pet.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            Text(pet.species + " | " + pet.breed)
                                                .foregroundColor(.black)
                                        }
                                    }
                                })
                        }.navigationBarHidden(true)
                    }
                    
                }
            }.padding(.leading, 30.0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
            .environmentObject(PetModel())
    }
}
