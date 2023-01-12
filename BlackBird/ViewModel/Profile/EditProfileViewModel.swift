//
//  EditProfileViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    var user: User
    @Published var uploadComplete = false
    
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
        self.uploadComplete.toggle()
    }
    

    func uploadUserData(name: String?, bio: String?, website: String?, location: String?) {
        
        let userId = user.id
        
        let urlPath = "/users/\(userId)"
        
        let url = URL(string: "http://localhost:3000\(urlPath)")!
        
        AuthServices.makePatchRequestWithAuth(urlString: url, reqBody: ["name": name, "bio": bio, "website": website, "location": location]) { res in
            
            DispatchQueue.main.async {
                self.save(name: name, bio: bio, website: website, location: location)
                self.uploadComplete = true

            }
        }
    }
    
}
