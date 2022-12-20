//
//  HomeView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/7.
//
//favQs apikey:
//418e36330b5982ab2ec1988d51b6574f
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loginData:Login
    let content:String=""
    @EnvironmentObject var dummyFetcher : DummyFetcher
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            
            VStack{
                Text("Dummy Community").bold()
                NavigationView {
                    List{
                        ForEach(dummyFetcher.posts) { post in
                            PostRow(post: post).listRowInsets(EdgeInsets())
                        }
                    }.onAppear(perform: {
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
