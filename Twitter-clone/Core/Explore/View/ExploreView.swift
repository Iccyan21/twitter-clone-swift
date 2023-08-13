//
//  ExploreView.swift
//  Twitter-clone
//
//  Created by いっちゃん on 2023/07/27.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
   
    
    var body: some View {
            VStack {
                SerachBar(text: $viewModel.serachText)
                    .padding()
                
                ScrollView {
                    LazyVStack{
                        ForEach(viewModel.serachableUsers){ user in
                            NavigationLink{
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }
                            
                        }
                    }
                }
            }
        
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
