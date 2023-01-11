//
//  CreateTweetView.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct CreateTweetView : View {
    
    @ObservedObject var viewModel = CreateTweetViewModel()
    
    @Binding var show : Bool
    let user: User

    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var text = ""
    @State var imagePickerRepresented = false
    @State var width = UIScreen.main.bounds.width
    
    var body : some View {
        VStack {
            
            HStack {
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    if text != ""{
                        self.viewModel.uploadPost(text: text)
                    }
                    self.show.toggle()
                }) {
                    Text("Post").padding()
                    
                }.background(Color(.black))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            MultilineTextField(text: $text)
            
            Button{
                
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipped()
                    .padding(.top)
                    .foregroundColor(.black)
            }

        }.padding()
    }
}
