//
//  LandmarkList.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/1/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    //@State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
            List {
                
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favotite only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landMark: landmark)
                        }
                    }
                }
            }
       .navigationBarTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList().environmentObject(UserData())
        }
        
    }
}
