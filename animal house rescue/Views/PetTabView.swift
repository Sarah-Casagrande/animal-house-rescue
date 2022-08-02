//
//  PetTabView.swift
//  animal house rescue
//
//  Created by Sarah Casagrande on 8/2/22.
//

import SwiftUI

struct PetTabView: View {
    var body: some View {
        
        TabView {
            
            PetFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            FullPetListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("All Pets")
                    }
                }
            
        }.environmentObject(PetModel())
        
    }
}

struct PetTabView_Previews: PreviewProvider {
    static var previews: some View {
        PetTabView()
    }
}
