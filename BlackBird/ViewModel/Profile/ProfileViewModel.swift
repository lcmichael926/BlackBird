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
    
    //Execute functions below evereytime when init profile view
    init(user: User) {
        self.user = user
        fetchTweet()
        checkIfUserIsCurrentUser()
        checkIfUserIsFollowed()
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
    
    func follow() {
        guard let authedUser = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/follow"
        
        RequestServices.followingProcess(id: self.user.id) { result in
            print(result)
            print("Followed")
        }
        self.user.isFollowed = true
    }
    
    func unfollow() {
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/unfollow"
        
        RequestServices.followingProcess(id: self.user.id) { result in
            print(result)
            print("Unfollowed")
        }
        print("Unfollowed")
        self.user.isFollowed = false
    }
    
    func checkIfUserIsFollowed() {
//        if (self.tweet.likes.contains(self.currentUser.id)) {
//            self.tweet.didLike = true
//        }
//        else {
//            self.tweet.didLike = false
//        }
        
        if (self.user.followers.contains(AuthViewModel.shared.currentUser!._id)) {
            self.user.isFollowed = true
        }
        else {
            self.user.isFollowed = false
        }
    }
    
}
