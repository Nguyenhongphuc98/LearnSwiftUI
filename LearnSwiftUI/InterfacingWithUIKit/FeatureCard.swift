//
//  FeatureCard.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/3/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct FeatureCard: View {
    
    let landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.8),
                         Color.black.opacity(0)]
            ),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2.0, contentMode: .fit)
            .overlay(
                ZStack(alignment: .bottomLeading) {
                    Rectangle().fill(gradient)
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.title)
                            .bold()
                        
                        Text(landmark.park)
                            .font(.subheadline)
                    }.foregroundColor(.white)
                    .padding()
                }
        )
            
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: features[0])
    }
}
