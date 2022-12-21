//
//  DummySaver.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

import Foundation
import SwiftUI

class DummySaver:ObservableObject {
    @AppStorage("posts") var postsData: Data?
    
    @Published var posts = [Post]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                postsData = try encoder.encode(posts)
            } catch {
                print(error)
            }
        }
    }
    
    init() {
        if let postsData = postsData {
            let decoder = JSONDecoder()
            do {
                posts = try decoder.decode([Post].self, from: postsData)
            } catch  {
                print(error)
            }
        }
    }
}
