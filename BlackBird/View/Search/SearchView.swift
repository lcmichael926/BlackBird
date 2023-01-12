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
    
    var body : some View{
        
        VStack {
            
            ScrollView{
                
                SearchBar(text: $text, isEditing: $isEditing)
                
                List(0..<9){ i in
                    SearchCell(tag: "hello", tweets: "hello")
                    
                }
            }
            
            
        }
    }
}

