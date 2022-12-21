//
//  LoginView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//

import SwiftUI
import UIKit
import AlertX
struct SignInView: View {
    @EnvironmentObject var loginData:Login
    @State var email:String=""
    @State var password:String=""
    @State private var showingAlert = false
    @State private var activeAlert : ActiveAlert = .login
    var body: some View {
        NavigationView{
            VStack{
                Text("Dummy Community")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .center)
                TextField("email",text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50, alignment: .center)
                SecureField("password",text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 100, alignment: .center)
                Button(action: {
                    
                    let url = URL(string: "https://favqs.com/api/session")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("Token token=\"418e36330b5982ab2ec1988d51b6574f\"", forHTTPHeaderField: "Authorization")
                    let encoder = JSONEncoder()
                    let user = CreatedSessionBody(user:SessionUser(login: email, password: password))
                    let data = try? encoder.encode(user)
                    request.httpBody = data
                    print("user=\(user)")
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let data = data{
                            do{
                                let content = String(data: data, encoding: .utf8)
                                print("content=\(String(describing: content))")
                                let decoder = JSONDecoder()
                                let createSessionResponse = try decoder.decode(CreateSessionResponse.self, from: data)
                                print("CCCCCC")
                                print(createSessionResponse)
                                loginData.token = createSessionResponse.Token
                                loginData.login=createSessionResponse.login
                                
                            }catch{
                                print("EERRRORRRR")
                                print(error)
                                showingAlert = true
                                activeAlert = .login
                            }
                        }else if error != nil{
                            print("NETTTT")
                            showingAlert = true
                            activeAlert = .net
                        }
                    }.resume()
                }, label: {
                    Text("Sign In")
                })
                .alertX(isPresented: $showingAlert, content: { () -> AlertX in
                    switch activeAlert{
                    case .login:
                        return AlertX(title: Text("Email or Password Error"), theme: .wine(withTransparency: true, roundedCorners: true),
                                      animation: .classicEffect())
                    case .net:
                        return AlertX(title: Text("Internet Error"), theme: .wine(withTransparency: true, roundedCorners: true),
                                      animation: .classicEffect())
                    }
                })
                .frame(width: 100, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .padding()
                
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        Text("Sign Up")
                    })
                
            }.offset(y: -150.0)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
