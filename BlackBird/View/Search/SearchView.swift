//
//  SearchView.swift
//  BlackBird
//
//  Created by Michael Lau on 8/1/2023.
//

import SwiftUI

struct SearchView : View {
    
    @State var text = ""
    @State var isEditing = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var users: [User] {
        return text.isEmpty ? viewModel.users : viewModel.filteredUsers(text)
    }
    
    var body : some View{
        
        VStack {
            
            ScrollView{
                
                SearchBar(text: $text, isEditing: $isEditing)
                
                LazyVStack{ 
                    ForEach(users) { user in
                        NavigationLink(destination: UserProfile(user: user)) {
                            SearchUserCell(user: user)
                                .padding(.leading)
                        }
                    }
                }
            }
            
            
        }
    }
}

