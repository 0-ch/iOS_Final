//
//  lin_FinalApp.swift
//  lin_Final
//
//  Created by User01 on 2022/11/16.
//

import SwiftUI

@main
struct lin_FinalApp: App {
    var body: some Scene {
        WindowGroup {
            if Bool.random(){
                ContentView()
            }else{
                Text("login")
            }
            
        }
    }
}
