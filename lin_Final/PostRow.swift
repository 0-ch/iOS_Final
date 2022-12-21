//
//  PostRow.swift
//  lin_Final
//
//  Created by User01 on 2022/12/7.
//

import SwiftUI
import UIKit
import Kingfisher

struct PostRow: View {
    var post:Post
    //    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:MyURL]]];
    var body: some View {
        //        Text("id:\(post.id)")
        HStack{
            Text("")
            KFImage(URL(string: post.owner.picture))
                .resizable()
                .frame(width: 30, height: 30)
                .scaledToFill()
                .clipShape(Circle())
            Text("\(post.owner.firstName) \(post.owner.lastName)").bold()
        }
        KFImage(URL(string: post.image))
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            .scaledToFill()
        HStack{
            Text("")
            VStack(alignment: .leading){
                Text("")
                if post.likes > 1{
                    Text("\(post.likes) likes")
                }else if post.likes == 1{
                    Text("\(post.likes) like")
                }
                Text("\(post.owner.firstName) \(post.owner.lastName)").bold() +
                    Text(" \(post.text)")
                NavigationLink(
                    destination: PostView(post:post),
                    label: {
                        Text("")
                        EmptyView()
                    })
                    .opacity(0)
                
                Text("\(String(post.publishDate.prefix(10)))").font(.footnote).foregroundColor(.gray)
                Text("")
            }
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(post: Post())
    }
}
