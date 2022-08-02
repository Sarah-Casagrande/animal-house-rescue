//
//  PetFeaturedView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/2/22.
//

import SwiftUI

struct PetFeaturedView: View {

    @EnvironmentObject var model:PetModel
    @State var detailView = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Pets")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    
                    ForEach (0..<model.pets.count) { index in
                            
                            Button(action: {
                                self.detailView = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.pets[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.pets[index].name)
                                            .padding(5)
                                    }
                                }
                            }).tag(index)
                            .sheet(isPresented: $detailView) {
                                PetDetailView(pet: model.pets[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
        }
        .onAppear {
            setFeaturedIndex()
        }
    }
    
    func setFeaturedIndex() {
        let index = model.pets.firstIndex{ (pet) -> Bool in
            return pet.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        PetFeaturedView()
            .environmentObject(PetModel())
    }
}
