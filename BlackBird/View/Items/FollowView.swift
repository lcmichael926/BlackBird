//
//  FollowView.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct FollowView: View {
    
    var count: Int
    var title: String
    
    var body: some View {
        HStack{
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}
