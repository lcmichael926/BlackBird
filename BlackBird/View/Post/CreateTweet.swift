//
//  CreateTweetView.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct CreateTweet : View {
    
    @ObservedObject var viewModel = CreateTweetViewModel()
    
    @Binding var show : Bool
    @State var text = ""
    
    @State var imagePickerRepresented = false
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
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
            
            if postImage == nil {
                Button{
                    self.imagePickerRepresented.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerRepresented){
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
            }
            
            
            else if let image = postImage{
                VStack{
                    
                    HStack(alignment: .top){
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                    }

                    Spacer()
                }
            }

        }.padding()
    }
}

extension CreateTweet {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
