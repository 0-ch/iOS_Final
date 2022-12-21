//
//  SearchView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/19.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var dummyFetcher : DummyFetcher
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("SEARCH").bold()
                NavigationView{
                    List{
                        TextField("Search by tag", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        ForEach(dummyFetcher.searchPosts) { post in
                            PostRow(post: post).listRowInsets(EdgeInsets())
                        }
                        
                        
                    }
                }.onChange(of: searchText) { newValue in
                    dummyFetcher.getSearchPost(searchText: searchText)
                }
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
