//
//  CollectView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

import SwiftUI

struct CollectView: View {
    @EnvironmentObject var dummySaver:DummySaver
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("COLLECT").bold()
                NavigationView{
                    List {
                        ForEach(dummySaver.posts) { post in
                            PostRow(post: post).listRowInsets(EdgeInsets())
                        }
                        .onDelete { indexSet in
                            dummySaver.posts.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView()
    }
}
