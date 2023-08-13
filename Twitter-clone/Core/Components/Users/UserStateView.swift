//
//  UserStateView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/02.
//

import SwiftUI

struct UserStateView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack (spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Follwers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
        }

    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView()
    }
}
