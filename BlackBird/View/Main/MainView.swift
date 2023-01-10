//
//  MainView.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TopBar()
            Home()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
