//
//  EditProfileViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    //Optional value due to user may only want to change some of them only
    func save(name: String?, bio: String?, website: String?, location: String?) {
        
        guard let userNewName = name else { return }
        guard let userNewBio = bio else { return }
        guard let userNewWebsite = website else { return }
        guard let userNewLocation = location else { return }
        self.user.name = userNewName
        self.user.bio = userNewBio
        self.user.website = userNewWebsite
        self.user.location = userNewLocation
    }
    
}
