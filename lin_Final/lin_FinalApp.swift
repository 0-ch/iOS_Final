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
    @StateObject private var dummySaver = DummySaver()
    @StateObject  var language = Language()
    var body: some Scene {
        WindowGroup {
            if language.data == ""{
                HStack{
                    Button(action: {
                        language.data = "en"
                    }, label: {
                        Text("English").font(.title)
                    })
                    Text("or")
                    Button(action: {
                        language.data = "zh-Hant"
                    }, label: {
                        Text("Chinese").font(.title)
                    })
                }
            }else{
                if loginData.token == ""
                {
                    SignInView().environmentObject(loginData)
                        .environmentObject(dummyFetcher)
                        .environmentObject(dummySaver)
                        .environment(\.locale, .init(identifier: language.data))
                }else{
                    ContentView().environmentObject(loginData)
                        .environmentObject(dummyFetcher)
                        .environmentObject(dummySaver)
                        .environment(\.locale, .init(identifier: language.data))
                }
            }

        }
    }
}
