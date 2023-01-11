//
//  AuthViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 11/1/2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    init() {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "jsonwebtoken")
        
        if token != nil {
            isAuthenticated = true
            
            if let userId = defaults.object(forKey: "userid") {
                fetchUser(userId: userId as! String)
                print("User Fetched")
            }
        }
        else {
            isAuthenticated = false
        }
    }
    
    func login(email: String, password: String){
        
        let defaults = UserDefaults.standard
        
        AuthServices.login(email: email, password: password) { result in
            switch result{
            case.success(let data):
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else {return}
                DispatchQueue.main.async {
                    defaults.set(user.token, forKey: "jsonwebtoken")
                    defaults.set(user.user.id, forKey: "userid")
                    self.currentUser = user.user
                    print("logged in")
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func register(name: String, username: String, email: String, password: String){
        AuthServices.register(email: email, username: username, password: password, name: name) { result in
            switch result{
            case.success(let data):
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else {return}
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchUser(userId: String){
        AuthServices.fetchUser(id: userId) { result in
            switch result {
            case.success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                
                DispatchQueue.main.async {
                    UserDefaults.standard.setValue(user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = user
                    print(user)
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout(){
        
    }
}
