//
//  AuthenticationHeader.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/03.
//

import SwiftUI

struct AutheHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{ Spacer() }
            
            Text("Hello")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }
        .frame(height: 260)
        // ここで少し左距離あけてる
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        
        // 右下の丸くなっているところの部分
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AutheHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AutheHeaderView(title1: "Hello", title2: "Welcaome back")
    }
}
