//
//  UserProfile.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    
    let user: User
    
    @ObservedObject var viewModel: ProfileViewModel
    
    //For change button EditProfile and Follow use
    var isCurrentUser: Bool {
        return viewModel.user.isCurrentUser ?? false
    }
    
    @State var editProfileShow = false

    //Create smooth animation
    @Namespace var animation
    
    @Environment(\.colorScheme) var colorScheme
    @State var currentTab = "Tweets"
    @State var offset: CGFloat = 0
    @State var tabBarOffset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        //Check is current user or not on console
        print("USER: \(viewModel.user.isCurrentUser)")
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                
                // Header View...
                GeometryReader{ proxy -> AnyView in
                    
                    // Sticky Header...
                    let minY = proxy.frame(in: .global).minY
                    
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return AnyView(
                        ZStack{
                            // Banner...
                            Image("banner")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                                .cornerRadius(0)
                            
                            BlurView()
                                .opacity(blurViewOpacity())
                            
                            // Title View...
                            VStack(spacing: 5, content: {
                                
                                Text(self.user.username)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("20 Tweets")
                                    .foregroundColor(.white)
                            })
                            // to slide from bottom added extra 60
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleTextOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }
                            .clipped()
                            // Stretchy Header
                            .frame(height: minY > 0 ? 180 + minY : nil)
                            .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)

                VStack{
                    HStack{
                        KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.user.id)/avatar"))
                            .placeholder({
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .clipShape(Circle())
                            .offset(y: offset < 0 ? getOffset() - 20 : -20)
                            .scaleEffect(getScale())
                        
                        Spacer()
                        
                        if (self.isCurrentUser){
                            Button(action: {
                                self.editProfileShow.toggle()
                            }, label: {
                                Text("Edit Profile")
                                    .foregroundColor(.blue)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(
                                        Capsule()
                                            .stroke(Color.blue,lineWidth: 1.5)
                                    )
                            })
                            .sheet(isPresented: $editProfileShow){
                                
                            } content: {
                                EditProfileView(user: $viewModel.user)
                            }
                        }
                        else{
                            Button {
                                //Call follow function
                                self.viewModel.follow()
                            } label: {
                                Text("Follow")
                                    .foregroundColor(.blue)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(
                                        ZStack{
                                            Capsule()
                                                .foregroundColor(.black)
                                        }
                                    )
                            }

                        }
                    }
                    .padding(.top,-25)
                    .padding(.bottom,-10)
                    
                    // Profile Data...
                    HStack{
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text(self.viewModel.user.username)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("@\(self.viewModel.user.username)")
                                .foregroundColor(.gray)
                            
                            Text(viewModel.user.bio ?? "Hi, Nice to meet you! Hi, Nice to meet you! Hi, Nice to meet you!")
                            
                            HStack(spacing: 8){
                                if let userLocation = viewModel.user.location {
                                    if (userLocation != "") {
                                        HStack(spacing: 2) {
                                            Image(systemName: "mappin.circle.fill")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userLocation)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                                if let userWebsite = viewModel.user.website {
                                    if (userWebsite != "") {
                                        HStack(spacing: 2) {
                                            Image(systemName: "link")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userWebsite)
                                                .foregroundColor(Color("bg"))
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                            }
                            
                            HStack(spacing: 5){
                                
                                Text("20")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                
                                Text("Followers")
                                    .foregroundColor(.gray)
                                
                                Text("400")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                    .padding(.leading,10)
                                
                                Text("Following")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top,8)
                        })
                        .padding(.leading, 8)
                        .overlay(GeometryReader { proxy -> Color in
                                
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.titleOffset = minY
                                }
                                return Color.clear
                            }
                            .frame(width: 0, height: 0),alignment: .top)
                        Spacer()
                    }
                    
                    // Custom Segmented Menu...
                    
                    VStack(spacing: 0, content: {
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 0, content: {
                                
                                TabButton(title: "Posts", currentTab: $currentTab, animation: animation)
                                
                                TabButton(title: "Posts & Likes", currentTab: $currentTab, animation: animation)
                                
                                TabButton(title: "Media", currentTab: $currentTab, animation: animation)
                                
                                TabButton(title: "Likes", currentTab: $currentTab, animation: animation)
                            })
                        })
                        
                        Divider()
                    })
                    .padding(.top,30)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay(
                    
                        GeometryReader{ proxy -> Color in
                            
                            let minY = proxy.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                self.tabBarOffset = minY
                            }
                            return Color.clear
                        }
                        .frame(width: 0, height: 0),alignment: .top
                    )
                    .zIndex(1)
                    
                    VStack(spacing: 18) {
                        
                        ForEach(viewModel.tweets){ tweet in
                            TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                        }
                        
                    }
                    .padding(.top)
                    .zIndex(0)
                }
                .padding(.horizontal)
                .zIndex(-offset > 80 ? 0 : 1)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func getTitleTextOffset()->CGFloat{
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    // Profile Effect
    func getOffset()->CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale()->CGFloat{
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
    
    func blurViewOpacity()->Double{
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
    
}

