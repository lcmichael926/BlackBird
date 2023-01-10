//
//  MessageCell.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct MessageCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
                
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                
                
                VStack(alignment: .leading, spacing: -1, content: {
                    
                    HStack {
                        Text("Michael ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            
                        
                            
                            Text("@lcmichael926")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Text("10/1/22")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                        Text("You: I love playing Apex!")
                            .foregroundColor(.gray)
                    
                    Spacer()
                    
                })
                .padding(.top, 2)
            }
        }.frame(width: width, height: 84, alignment: .center)
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
