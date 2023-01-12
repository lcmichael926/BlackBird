//
//  SearchUserCell.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: "http://localhost:3000/users/\(self.user.id)/avatar"))
                .placeholder(
                    {Image("profile")
                            .resizable()
                    }
                )
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Text(user.username)
                    .foregroundColor(.black)
                
            }
            
            Spacer(minLength: 0)
        }
    }
}

