//
//  ContentView.swift
//  lin_Final
//
//  Created by User01 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem { Image(systemName: "house")}
            SearchView().tabItem{ Image(systemName:"magnifyingglass")}
            NewPostView().tabItem{Image(systemName:"plus")};
            ProfileView().tabItem{Image(systemName:"person")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
