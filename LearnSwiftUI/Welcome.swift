//
//  Welcome.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/1/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LandmarkList().environmentObject(UserData())) {
                    Text("Essential")
                }
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
