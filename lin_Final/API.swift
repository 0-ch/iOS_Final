//
//  API.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//
import Foundation

struct  CreatedSessionBody:Encodable {
    public let user:SessionUser
}

struct SessionUser :Encodable{
    public let login: String
    public let password: String
}

struct  CreateSessionResponse:Decodable {
    public let Token: String
    public let login: String
    public let email:String
    
    enum CodingKeys:String,CodingKey{
        case Token = "User-Token"
        case login
        case email
    }
}

struct  CreatedUsersBody:Encodable {
    public let user:CreatedUsers
}

struct CreatedUsers:Encodable {
    let login: String
    let email: String
    let password: String
}

struct  CreatedUsersResponse:Decodable {
    let Token: String
    let login: String
    enum CodingKeys:String,CodingKey{
        case Token = "User-Token"
        case login
    }
}

struct PostResponse{
    let data :[Post]
    let total: Int
    let page: Int
    let limit: Int
}


struct Post {
    let id : String
    let image: String
    let likes: Int
    let tags: [String]
    let text : String
    let publishDate : String
    let owner: [Owner]
}
struct Owner {
    let id: String
    let title: String
    let firstName: String
    let lastName:String
    let picture: String
}
