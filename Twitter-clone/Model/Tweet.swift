//
//  Tweet.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/13.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let likes: Int
    let uid: String
    
    var user: User?
    var didLike: Bool? = false
}
