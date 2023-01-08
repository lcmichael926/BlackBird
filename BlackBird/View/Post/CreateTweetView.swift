//
//  CreateTweetView.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct CreateTweetView : View {
    @State var text = ""
    var body : some View {
        VStack{
            HStack{
                Button(action: {
                    
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Post").padding()
                    
                }.background(Color(.black))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            MultilineTextField(text: $text)
            
        }.padding()
    }
}


struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView()
    }
}
