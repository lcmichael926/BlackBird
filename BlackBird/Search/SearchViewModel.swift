//
//  SearchViewModel.swift
//  BlackBird
//
//  Created by Michael Lau on 12/1/2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        AuthServices.requestDomain = "http://localhost:3000/users"
        
        AuthServices.fetchUser { res in
            switch res {
                case .success(let data):
                    guard let users = try? JSONDecoder().decode([User].self, from: data as! Data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.users = users
                    }

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.name.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
    
}

