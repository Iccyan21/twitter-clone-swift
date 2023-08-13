//
//  TeetFeedView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/07/26.
//

// ここはTweetのデザイン
import SwiftUI

struct TeetFeedView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top,spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                    // user info & tweet caption
                VStack (alignment: .leading, spacing:4){
                        HStack{
                            Text("Brute Wayne")
                                .font(.subheadline).bold()
                            Text("@botman")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("2a")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            
                            
                        }
                        
                        // tweet caption
                        Text("I belive in Harry Dent")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                
               
                
                
            }
            //acton button
            
            HStack{
                Button{
                    // action goes here..
                    
                } label: {
                    Image(systemName: "bubble.left").font(.subheadline)
                    
                }
                
                Spacer()
                
                Button{
                    // action goes here..
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath").font(.subheadline)
                    
                }
                
                Spacer()
                
                Button{
                    // action goes here..
                    
                } label: {
                    Image(systemName: "heart").font(.subheadline)
                    
                }
                Spacer()
                
                Button{
                    // action goes here..
                    
                } label: {
                    Image(systemName: "bookmark").font(.subheadline)
                    
                }
         
         
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }

    }
}

struct TeetFeedView_Previews: PreviewProvider {
    static var previews: some View {
        TeetFeedView()
    }
}
