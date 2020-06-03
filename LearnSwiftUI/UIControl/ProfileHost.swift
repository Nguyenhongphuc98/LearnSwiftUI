//
//  ProfileHost.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/3/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State var draftProfile = Profile.default
    
    @EnvironmentObject var userData: UserData
    
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Candel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive {
                 ProfileSummary(profile: draftProfile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
           
        }
    .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
        .environmentObject(UserData())
    }
}
