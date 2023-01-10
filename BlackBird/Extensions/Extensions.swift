//
//  Extensions.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import UIKit
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
