//
//  LoginView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/08/02.
//
// login処理

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // parent container
        VStack{
            
            // header view
            AutheHeaderView(title1: "Hello", title2: "Welocome Back")
            // 入力欄
            VStack(spacing: 40){
                CustomInoutField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                
                
                CustomInoutField(imageName: "lock", placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view ...")
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                    
                        .fontWeight(.semibold)
                    
                        .foregroundColor(Color(.systemBlue))
                    
                        .padding(.top)
                    
                        .padding(.trailing,24)
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            } label: {
                 Text("Sigh In")
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
            
            NavigationLink {
                RegistrasionView()
                    .navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Dont have an account??")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            
            .padding(.bottom, 32)
            
            .foregroundColor(Color(.systemBlue))
            
           
            
        }
        .ignoresSafeArea()
        
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
