//
//  HikeBadge.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/3/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Badge()
            .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3)
            .frame(width: 100, height: 100)
            
            Text("Preview testing")
                .font(.caption)
            .accessibility(hint: Text("Badge for \(name)"))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview testing")
    }
}
