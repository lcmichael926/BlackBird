//
//  SearchUserCell.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
            .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text("Michael")
                    .fontWeight(.heavy)
                Text("@lcmichael926")
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct SearchUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCell()
    }
}
