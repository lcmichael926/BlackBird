//
//  MenuItem.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct MenuButton: View {
    
    var title: String
    
    var body: some View {
        HStack(spacing: 15, content: {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
        })
        
        .padding(.vertical, 12)
    }
}
