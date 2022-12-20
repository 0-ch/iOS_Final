//
//  API.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//
import Foundation

struct  CreatedSessionBody:Codable {
    public let user:SessionUser
}

struct SessionUser :Codable{
    public let login: String
    public let password: String
}

struct  CreateSessionResponse:Codable {
    public let Token: String
    public let login: String
    public let email:String
    
    enum CodingKeys:String,CodingKey{
        case Token = "User-Token"
        case login
        case email
    }
}

struct  CreatedUsersBody:Codable {
    public let user:CreatedUsers
}

struct CreatedUsers:Codable {
    let login: String
    let email: String
    let password: String
}

struct  CreatedUsersResponse:Codable {
    let Token: String
    let login: String
    enum CodingKeys:String,CodingKey{
        case Token = "User-Token"
        case login
    }
}

struct CreatePostResponse:Codable{
    let data:[Post]
    let total: Int
    let page: Int
    let limit: Int
    
//    init(){
//        data = [Post()]
//        total = 0
//        page = 0
//        limit = 0
//    }
}


struct Post:Codable ,Identifiable{
    
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text: String
    let publishDate : String
    let owner: Owner
    
    init(){
        id = ""
        image = ""
        likes = 0
        tags = []
        text = ""
        publishDate = ""
        owner = Owner()
    }
}
struct Owner:Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName:String
    let picture: String
    init(){
        id = ""
        title = ""
        firstName = ""
        lastName = ""
        picture = ""
    }
}
