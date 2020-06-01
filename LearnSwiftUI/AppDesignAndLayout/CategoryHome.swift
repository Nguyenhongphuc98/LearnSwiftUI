//
//  CategoryHome.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/1/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    @State var showingProfile = false
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by:  { $0.category.rawValue}
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter{ $0.isFeatured }
    }
    
    var profileButton: some View {
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
            .accessibility(label: Text("User profile"))
            .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(
                        categoryName: key,
                        items: self.categories[key]!
                    )
                }.listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("See all")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("user profile")
            }
        }
    }
}

struct FeaturedLandmarks: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        landmarks[0].image
        .resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
