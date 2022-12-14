//
//  HomeView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/7.
//
//favQs apikey:
//418e36330b5982ab2ec1988d51b6574f
import SwiftUI

struct HomeView: View {

    var body: some View {
                List{
        Text("A")
        
        //            PostRow();
                }.onAppear(perform: {
                    var request = URLRequest(url: URL(string: "https://dummyapi.io/data/v1/post")!)
                    request.httpMethod = "GET"
                    request.setValue("63875387080315490a2416a4", forHTTPHeaderField:"app-id")
                    URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data,
                    let content = String(data: data, encoding: .utf8) {
                    print(content)
                        print(content.limit)
                    }
                    }.resume()
                })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
