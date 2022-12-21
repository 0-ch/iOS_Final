//
//  PostView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/20.
//

import SwiftUI
import Kingfisher
import UIKit

struct PostView: View {
    var post:Post
    @EnvironmentObject var dummyFetcher : DummyFetcher
    @EnvironmentObject var dummySaver : DummySaver
    @State var myComment = ""
    var body: some View {
        List{
            VStack(alignment:.leading){
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
                        
                        ForEach(0..<post.tags.count){
                            index in
                            Text("#\(post.tags[index])").foregroundColor(.blue)
                        }
                        Text("\(String(post.publishDate.prefix(10)))").font(.footnote).foregroundColor(.gray)
                        Text("")
                        
                        if dummyFetcher.postCommentResponse.total > 0
                        {
                            ForEach(dummyFetcher.comments) { comment in
                                Text("") +
                                    Text("\(comment.owner.firstName) \(comment.owner.lastName)").bold() +
                                    Text(" \(comment.message)") +
                                    Text("   \(String(comment.publishDate.prefix(10)))").font(.footnote).foregroundColor(.gray)
                                Text("")
                            }
                        }
                    }
                }
            }
            .listRowInsets(EdgeInsets())
            Button(action: {
                let isContain = dummySaver.posts.contains {
                    $0.id == post.id
                }
                if isContain {
                    //                    ForEach(0 ..< dummySaver.posts.count){
                    //                        index in
                    //                        if  dummySaver.posts[index].id == post.id
                    //                        {
                    //                            delete = index
                    //                        }
                    //                    }
                    for index in 0..<dummySaver.posts.count{
                        if  dummySaver.posts[index].id == post.id
                        {
                            if index == 0{
                                dummySaver.posts.removeLast()
                            }else if index == dummySaver.posts.count
                            {
                                dummySaver.posts.removeLast()
                            }
                            else{
                                dummySaver.posts.remove(at: index)
                            }
                        }
                    }
                } else {
                    dummySaver.posts.append(post)
                }
            }, label: {
                let isContain = dummySaver.posts.contains {
                    $0.id == post.id
                }
                if isContain {
                    Text("Cancel Favorite").foregroundColor(.blue)
                } else {
                    Text("Collect!").foregroundColor(.blue)
                }
            })
            
            //            HStack{
            //                TextField("留個言",text: $myComment)
            //                    .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 40, alignment: .center)
            //
            //                Button(action: {
            //                    //留言
            //                    myComment = ""
            //                    dummyFetcher.getPostCommentResponse(id:post.id)
            //                }, label: {
            //                    Image(systemName:"paperplane.fill").foregroundColor(.blue)
            //
            //                })
            //            }
        }.onAppear(perform: {
            dummyFetcher.getPostDetail(id: post.id)
            dummyFetcher.getPostCommentResponse(id:post.id)
        })
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
