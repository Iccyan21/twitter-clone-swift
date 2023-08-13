//
//  ExplationViewModel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/13.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var serachText = ""
    
    var serachableUsers: [User] {
        if serachText.isEmpty {
            return users
        } else {
            let lowereassedQuery = serachText.lowercased()
            
            return users.filter({
                $0.username.contains(lowereassedQuery) ||
                $0.fullname.contains(lowereassedQuery)
            })
        }
    }
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.feachUser { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
            
        }
    }
}
