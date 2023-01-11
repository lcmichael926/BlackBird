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

    init(tweet: Tweet) {
        self.tweet = tweet

        
    }
}
