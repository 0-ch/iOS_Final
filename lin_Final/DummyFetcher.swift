//
//  DummyFetcher.swift
//  lin_Final
//
//  Created by User01 on 2022/12/20.
//

import Foundation

class DummyFetcher:ObservableObject{
    @Published var posts = [Post]()
    @Published var showError = false
    
    var error: Error? {
        willSet {
            DispatchQueue.main.async {
                self.showError = newValue != nil
            }
        }
    }
    
    enum FetchError: Error {
        case invalidURL
    }
    
    func getPost(page:Int, limit:Int){
        print("into func get post")
        var request = URLRequest(url: URL(string: "https://dummyapi.io/data/v1/post?page=\(page)&limit=\(limit)")!)
        request.httpMethod = "GET"
        request.setValue("63875387080315490a2416a4", forHTTPHeaderField:"app-id")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let content = String(data: data, encoding: .utf8)
                    print("content=\(String(describing: content))")
                    let decoder = JSONDecoder()
                    let createPostResponse = try decoder.decode(CreatePostResponse.self, from: data)
                    print("CCCCCC")
                    print(createPostResponse)
                    self.posts = createPostResponse.data
                }catch{
                    print("EERRRORRRR")
                    print(error)
                }
            }
            else if let error = error{
                print(error)
            }
        }.resume()
    }
    
    init()
    {
        getPost(page: 1, limit: 10)
    }
}
