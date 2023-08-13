//
//  CustomInoutField.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/02.
//

import SwiftUI

struct CustomInoutField: View {
    let imageName: String
    let placeholderText: String
    // Password隠す
    var isSecureField: Bool? = false
    @Binding var text: String
    
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(placeholderText,text: $text)
                } else {
                    TextField(placeholderText,text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInoutField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInoutField(imageName: "enveloper", placeholderText: "Email",isSecureField: false,
                         text: .constant(""))
    }
}
