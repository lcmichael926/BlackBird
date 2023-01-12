//
//  CustomProfileTextField.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

struct CustomProfileTextField: View {
    
    @Binding var message: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if message.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                
                TextField("", text: $message)
                    .foregroundColor(.blue)
            }
        }
    }
}
