//
//  ProfileViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    
    init(user: User) {
        self.user = user
    }
    
}
