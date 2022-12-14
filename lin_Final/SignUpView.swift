//
//  SignUpView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/14.
//

import SwiftUI

struct SignUpView: View {
    @State var login:String=""
    @State var email:String=""
    @State var password:String=""
    var body: some View {
        NavigationView {
            VStack{
                Text("Dummy Community")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .center)
                TextField("使用者名稱",text: $login).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 100, alignment: .center)
                TextField("信箱",text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50, alignment: .center)
                TextField("密碼",text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 100, alignment: .center)
                Button(action: {
                    
                }
                , label: {
                    Text("註冊")
                }).frame(width: 100, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .padding()
            }.offset(y: -150.0)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
