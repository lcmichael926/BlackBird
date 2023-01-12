//
//  TweetCellViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI


import Foundation
import SwiftUI

class TweetCellViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    @Published var user: User?
    let currentUser: User

    init(tweet: Tweet, currentUser: User) {
        self.tweet = tweet
        self.currentUser = currentUser
        self.fetchUser(userId: tweet.user)
        checkIfUserLikedPost()
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        
        AuthServices.fetchUser() { res in
            switch res {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                    DispatchQueue.main.async {
                        self.user = user
                        print(user)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func likeTweet() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/like"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("Tweet has been liked")
            print("Console log: \(result)")
        }
        self.tweet.didLike = true
    }
    
    func unlikeTweet() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/unlike"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("Tweet has been unliked")
        }
        self.tweet.didLike = false
    }
    
    func checkIfUserLikedPost() {
        if (self.tweet.likes.contains(self.currentUser.id)) {
            self.tweet.didLike = true
        }
        else {
            self.tweet.didLike = false
        }
    }
}
