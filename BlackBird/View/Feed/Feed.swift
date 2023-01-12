//
//  Feed.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct Feed: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    let user: User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing:18){
                ForEach(viewModel.tweets) { tweet in
                    
                    TweetCellView(viewModel: TweetCellViewModel(tweet: tweet, currentUser: user))
                    
                    Divider()
                    
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        })
    }
}

