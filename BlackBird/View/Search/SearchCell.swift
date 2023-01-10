//
//  SearchCell.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import SwiftUI

struct SearchCell: View {
    
    var tag = ""
    var tweets = ""
    
    var body: some View {
        VStack(alignment: .leading,spacing: 5,
               content: {
            Text("hello").fontWeight(.heavy)
            Text(tweets + "Yooo").fontWeight(.light)
        })
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell()
    }
}
