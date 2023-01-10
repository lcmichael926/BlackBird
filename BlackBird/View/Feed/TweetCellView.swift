//
//  TweetCellView.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct TweetCellView: View {
    
    var tweet:String
    var tweetImage: String?
    
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 10, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:55, height:55)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10, content: {
                    (
                    Text("Michael")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    +
                    Text("@lcmichael926")
                    .foregroundColor(.gray)
                    )
                    Text(tweet)
                        .frame(maxHeight: 100, alignment: .top)
                    if let image = tweetImage{
                        GeometryReader{ proxy in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width,height: 250)
                                .cornerRadius(15)
                        }
                        .frame(height: 250)
                    }
                        
                })
            })
            //Bottom Part
            HStack(spacing: 50, content: {
                Button(action: {
                    
                }, label: {Image("Comments")
                        .resizable()
                        .frame(width: 16, height: 16)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {Image("Retweet")
                        .resizable()
                        .frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {Image("love")
                        .resizable()
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {Image("upload")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                
                
            })
            .padding(.top, 4)
            
        }
    }
}

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellView(tweet: sampleText)
    }
}

var sampleText = "I am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am GrootI am Groot"
