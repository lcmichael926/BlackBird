//
//  ProfileViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var tweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        fetchTweet()
        checkIfUserIsCurrentUser()
    }
    
    func fetchTweet(){
        
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.user.id)"
        
        RequestServices.fetchTweets { res in
            switch res {
                case .success(let data):
                    guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.tweets = tweets
                    }

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    //Check the user on the profile page is current user or not
    func checkIfUserIsCurrentUser() {
        if (self.user._id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        }
    }
    
}
