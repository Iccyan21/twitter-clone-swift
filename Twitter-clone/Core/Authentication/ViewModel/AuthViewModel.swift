//
//  AuthViewModel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/03.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currenUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, errror in
            if let errror = errror {
                print("DEBUG: Failed to register with error \(errror.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
        
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result,errror in
            if let errror = errror {
                print("DEBUG: Failed to register with error \(errror.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email":email, "username":username.lowercased(), "fullname": fullname,"uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error {
                        print("Firestore setData error: \(error.localizedDescription)")
                        return
                    }
                    print("Successfully set data!")
                    self.didAuthenticateUser = true
                    print("didAuthenticateUser is now \(self.didAuthenticateUser)")
                }

                
        }
    }
    
    func signOut(){
        // sets user session to nil so we login view
        userSession = nil
        
        // sigh user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image){
            profileImageUrl in Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){ _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
        
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
            
        service.fetchUser(withUid: uid) { user in
            self.currenUser = user
        }
    }
}
