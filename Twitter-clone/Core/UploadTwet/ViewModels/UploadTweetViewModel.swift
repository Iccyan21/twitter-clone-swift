//
//  UploadTweetViewModel.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/13.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){ success in
            if success {
                self.didUploadTweet = true
            } else {
                //eded
            }
        }
    }
}
