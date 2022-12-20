//
//  PostView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/20.
//

import SwiftUI

struct PostView: View {
    var post:Post
    var body: some View {
        NavigationView {
            Text(post.id)
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
