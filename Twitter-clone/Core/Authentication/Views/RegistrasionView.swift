//
//  RegistrasionView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/02.
//

import SwiftUI

struct RegistrasionView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    

    
    var body: some View {
        VStack{
            
           
            AutheHeaderView(title1: "Get stared.", title2: "Create your account")
            
            VStack(spacing: 40){
                CustomInoutField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                
                
                CustomInoutField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustomInoutField(imageName: "person", placeholderText: "Full name", text: $fullname)
                
                
                
                CustomInoutField(imageName: "lock", placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button{
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                 Text("Sigh Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340,height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            // Buttonデザイン
            .shadow(color: .gray.opacity(0.5), radius: 100, x:0, y:0)
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
                
            }label: {
                HStack{
                    Text("Alredy have an account??")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

struct RegistrasionView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrasionView()
    }
}
