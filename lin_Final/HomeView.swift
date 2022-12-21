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
    @State var now_page = 0
    @State var now_limit = 10
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            
            VStack{
                Text("Dummy Community").bold()
                NavigationView{
                    List{
                        HStack{
                            Spacer()
                            Button(action: {
                                if now_page > 100{
                                    now_page = 0
                                }else{
                                    now_page = now_page + 10
                                }
                                now_limit = 10
                                dummyFetcher.getPost(page: now_page, limit: now_limit)
                            }, label: {
                                Image(systemName:"arrow.clockwise")
                            })
                            Spacer()
                        }
                        
                        ForEach(dummyFetcher.posts) { post in
                            PostRow(post: post).listRowInsets(EdgeInsets())
                        }
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                now_limit = now_limit + 10
                                dummyFetcher.getPost(page: now_page, limit: now_limit)
                            }, label: {
                                Image(systemName:"ellipsis")
                            })
                            Spacer()
                        }
                    }
                    .onAppear(perform: {
                        dummyFetcher.getPost(page: 0, limit: 10)
                        configureBackground()
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
