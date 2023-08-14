//
//  TweetRowViewModel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/14.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet:Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet){
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet){
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.cheackIfUserLikedTweet(tweet){ didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
