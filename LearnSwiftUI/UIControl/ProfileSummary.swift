//
//  ProfileSummary.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/3/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    
    static let goalFormater: DateFormatter = {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        return format
    }()
    
    var body: some View {
        List {
            
            Text(profile.username)
                .font(.title)
                .bold()
            
            Text("Notifucations: \(profile.prefersNotifications ? "On" : "Off")")
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(profile.goalDate, formatter: Self.goalFormater)")
            
            VStack(alignment :.leading) {
                
                Text("Completed Badges")
                    .font(.headline)
                    .bold()
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Recently Hikes")
                    .font(.headline)
                    .bold()
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
