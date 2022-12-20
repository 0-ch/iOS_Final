//
//  lin_FinalApp.swift
//  lin_Final
//
//  Created by User01 on 2022/11/16.
//

import SwiftUI

@main
struct lin_FinalApp: App {
    @StateObject private var loginData = Login()
    @StateObject private var dummyFetcher = DummyFetcher()
    var body: some Scene {
        WindowGroup {
            if loginData.token == ""
            {
                SignInView().environmentObject(loginData)
                    .environmentObject(dummyFetcher)
            }else{
                ContentView().environmentObject(loginData)
                    .environmentObject(dummyFetcher)
            }
        }
    }
}
