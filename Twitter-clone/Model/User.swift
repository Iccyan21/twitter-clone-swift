//
//  User.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/08.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    let uid: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
