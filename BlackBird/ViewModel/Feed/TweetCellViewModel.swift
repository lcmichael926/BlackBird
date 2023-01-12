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

    init(tweet: Tweet) {
        self.tweet = tweet
        self.fetchUser(userId: tweet.user)
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        
        AuthServices.fetchUser(id: userId) { res in
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
}
