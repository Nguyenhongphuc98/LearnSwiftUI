//
//  UserData.swift
//  LearnSwiftUI
//
//  Created by phucnh7 on 6/1/20.
//  Copyright © 2020 phucnh7. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var showFavoritesOnly = false
    
    @Published var landmarks = landmarkData
}
