//
//  ProfileView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/07/27.
//
// Profileの名前のところ

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    
    @Namespace var animation
    
    init(user:User){
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View{
        VStack(alignment: .leading){
            // 関数呼び出し
            headerView
            
            actionzButtons
            
            userIndoDatails
            
            tweetFilterBar
            
            tweetsView
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
   
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "botman", fullname: "Bruce Wayne", profileImageUrl: "", email: "batman@gmail.com",uid: "User1"))
    }
}

extension ProfileView {
    var headerView: some View {
        VStack{
            ZStack(alignment: .topLeading){
                Color(.systemBlue)
                    .ignoresSafeArea()
                // 戻るボタン
                VStack{
                    Button {
                        mode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x:16, y:12)
                    }
                    
                }
                    
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72,height: 72)
                    .offset(x:16,y:24)
                
            }
            .frame(height: 96)
                
       
        }
    }
    var actionzButtons: some View{
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button{
                
            }label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke( Color.gray, lineWidth: 0.75))
            }
            
            
        }
        .padding(.trailing)
    }
    
    var userIndoDatails: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
            }
            
            Text(viewModel.user.username)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite vilein")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NY")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.thejocker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStateView()
                .padding(.vertical)
            
        }
        .padding(.horizontal)
        
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id:  \.rawValue){
                item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .blue : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                        
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectionFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y:16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack{
                ForEach(viewModel.tweets(forFilter: self.selectionFilter)){ tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
