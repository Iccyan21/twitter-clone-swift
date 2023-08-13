//
//  SideMenuViewModel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/02.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case likes
    case bookmarks
    case logout

    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .likes: return "Likes"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
            
        }
    }
    
    var imageName: String{
        switch self {
        case .profile: return "person"
        case .likes: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
            
        }
    }
}
