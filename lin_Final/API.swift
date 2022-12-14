//
//  API.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//

import Foundation

struct  CreatedUsersBody:Encodable {
    let login: String
    let email: String
    let password: String
}

struct  CreatedUsersResponse:Decodable {
    let Token: String
    let login: String
}

struct  CreatedSessionBody:Encodable {
    let login: String
    let password: String
}

struct  CreateSessionResponse:Decodable {
    let Token: String
    let login: String
    let email:String
    
    enum CodingKeys:String,CodingKey{
        case Token = "User-Token"
        case login
        case email
    }
}
