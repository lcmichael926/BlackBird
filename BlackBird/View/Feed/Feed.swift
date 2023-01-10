//
//  Feed.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false,
        content: {
            VStack(spacing:18){
                
                TweetCellView(tweet: "Hey Tim",
                tweetImage: "post")
                Divider()
                
                ForEach(1...20, id: \.self){ _ in
                    TweetCellView(tweet: sampleText)
                    Divider()
                }
            }
        })
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
