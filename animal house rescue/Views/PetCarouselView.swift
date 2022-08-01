//
//  PetCarouselView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/1/22.
//

import SwiftUI

struct PetCarouselView: View {
    
    @EnvironmentObject var model:PetModel
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach (model.pets) { index in
                    
                        VStack {
                            Image(index.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(index.name)
                        }
                }
            }
        }
    }
}
    
    struct PetCarouselView_Previews: PreviewProvider {
        static var previews: some View {
            PetCarouselView()
                .environmentObject(PetModel())
        }
    }
