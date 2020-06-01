//
//  CircleImage.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/1/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .frame(width: 200, height: 200, alignment: .center)
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("nature"))
    }
}
