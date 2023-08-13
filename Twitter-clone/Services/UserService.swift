//
//  UserService.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/08.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) ->  Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument {snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
                
            }
    }
    func feachUser(complection: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self)})
                complection(users)
            }
    }
}
