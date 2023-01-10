//
//  UserProfile.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct UserProfile: View {
    
    @State var offset: CGFloat = 0
    
    // For Dark Mode Adoption..
    @Environment(\.colorScheme) var colorScheme
    
    @State var currentTab = "Tweets"
    
    // For Smooth Slide Animation...
    @Namespace var animation
    
    @State var tabBarOffset: CGFloat = 0
    
    @State var titleOffset: CGFloat = 0
    
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
                            VStack(spacing: 5){
                                
                                Text("Michael")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("20 Tweets")
                                    .foregroundColor(.white)
                            }
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
            }
        }
    }
    
    func getTitleTextOffset()->CGFloat{
        
        // some amount of progress for slide effect..
        let progress = 20 / titleOffset
        
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        
        return offset
    }
    
    // Profile Shrinking Effect...
    func getOffset()->CGFloat{
        
        let progress = (-offset / 80) * 20
        
        return progress <= 20 ? progress : 20
    }
    
    func getScale()->CGFloat{
        
        let progress = -offset / 80
        
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        
        // since were scaling the view to 0.8...
        // 1.8 - 1 = 0.8....
        
        return scale < 1 ? scale : 1
    }
    
    func blurViewOpacity()->Double{
        
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
