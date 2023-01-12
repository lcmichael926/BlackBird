//
//  EditProfileView.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    
    @State var profileImage: Image?
    @State private var selectedImage: UIImage?
    
    @State var imagePickerRepresented = false
    
    @State var name: String
    @State var location: String
    @State var bio: String
    @State var website: String
    
    var body: some View {
        VStack{
            ZStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Save")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding()
                
                HStack{
                    Spacer()
                    Text("Edit Profile")
                        .fontWeight(.heavy)
                    Spacer()
                }
            }
            
            VStack{
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width, height: 180, alignment: .center)
                    .cornerRadius(0)
                
                // 3 Types situation:
                // No profile image -> New profile image
                // Old profile image -> New profile image
                // Invalid Image
                
                HStack{
                    if profileImage == nil {
                        Button {
                            self.imagePickerRepresented.toggle()
                        } label: {
                            KFImage(URL(string: "http://localhost:3000/users/id/avatar"))
                                .resizable()
                                .placeholder{
                                    Image("blankpp")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.leading, 12)
                        }
                        .sheet(isPresented: $imagePickerRepresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                    else if let image = profileImage {
                        VStack {
                            HStack(alignment: .top) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(y: -20)
                                
                            }
                            .padding()
                        }
                        .padding(.leading, 12)
                    }
                    Spacer()
                }
                .padding(.top, -25)
                .padding(.bottom, -10)
                
                VStack{
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Name")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $name, placeholder: "Add your name")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    
                    Divider()
                    
                    
                    
                    HStack {
                        ZStack {
                            HStack {
                                Text("Location")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $location, placeholder: "Add your location")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    
                    Divider()
                    
                    
                    
                    HStack {
                        ZStack(alignment: .topLeading) {
                            HStack {
                                Text("Bio")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileBioTextField(bio: $bio)
                                .padding(.leading, 86)
                                .padding(.top, -6)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    
                    Divider()
                    
                    
                    
                    HStack {
                        ZStack(alignment: .topLeading) {
                            HStack {
                                Text("Website")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $website, placeholder: "Add your website")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
            
            
        }
    }
}

extension EditProfileView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}
