//
//  SerachBar.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/13.
//

import SwiftUI

struct SerachBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField("Serach...",text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,8)
                        
                    }
                )
        }
        .padding(.horizontal,4)
    }
        
}

struct SerachBar_Previews: PreviewProvider {
    static var previews: some View {
        SerachBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
