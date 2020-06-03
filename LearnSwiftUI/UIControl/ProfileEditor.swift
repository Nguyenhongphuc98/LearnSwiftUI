//
//  ProfileEditor.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/3/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)
        return min!...max!
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                .bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading) {
                Text("Seasonal Photo")
                    .bold()
                    .font(.headline)
                Picker("Seasonal", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date")
                .bold()
                
                DatePicker("", selection: $profile.goalDate, in: dateRange, displayedComponents: .date)
            }
            .padding(.top)
        }
    .padding()
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
