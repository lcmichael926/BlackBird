//
//  Extensions.swift
//  BlackBird
//
//  Created by Michael Lau on 10/1/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//class Car {
//    var speed: Int = 0
//    var seats: Int = 0
//}

//extension Car {
//    var color: String = "Black"
//}
