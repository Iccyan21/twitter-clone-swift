//
//  Twitter_cloneApp.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/07/26.
//

import SwiftUI
import Firebase



@main
struct Twitter_cloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                
                    
            }
            .environmentObject(viewModel)
            
        }
    }
}
