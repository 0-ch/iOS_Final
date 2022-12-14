//
//  LoginView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//

import SwiftUI
import UIKit
struct LoginView: View {
    @State var email:String=""
    @State var password:String=""
    var body: some View {
        NavigationView{
            VStack{
                Text("Dummy Community")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .center)
                TextField("信箱",text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50, alignment: .center)
                TextField("密碼",text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 100, alignment: .center)
                Button(action: {
                    let url = URL(string: "https://favqs.com/api/users")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("Token token=\"418e36330b5982ab2ec1988d51b6574f\"", forHTTPHeaderField: "Authorization")
                    let encoder = JSONEncoder()
                    let user = CreatedSessionBody(login: email, password: password)
                    let data = try? encoder.encode(user)
                    request.httpBody = data
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let data = data {
                            do {
                                print(data)
                                print(response)
                                let decoder = JSONDecoder()
                                let createSessionResponse = try decoder.decode(CreateSessionResponse.self, from: data)
                                print(createSessionResponse)
                            } catch  {
                                print(error)
                            }
                        }
                    }.resume()
                }, label: {
                    Text("登入")
                }).frame(width: 100, height: 50, alignment: .center)
                .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                    .padding()
                
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                        Text("註冊")
                    })
                
            }.offset(y: -150.0)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
