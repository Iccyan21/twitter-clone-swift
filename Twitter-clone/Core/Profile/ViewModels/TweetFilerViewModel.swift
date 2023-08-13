//
//  TweetFilerViewMOdel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/07/30.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "likes"
        }
    }
}
