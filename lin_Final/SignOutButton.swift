//
//  SignOutView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/20.
//

import SwiftUI

struct SignOutButton: View {
    @EnvironmentObject var loginData:Login
    var body: some View {
        HStack
        {
            Spacer()
            Button(action: {
                loginData.token=""
            }, label: {
                Text("Sign Out")
            })                .frame(width: 100, height: 50, alignment: .center)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
            .padding()
            Spacer()
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton().environment(\.locale, .init(identifier: "zh-Hant"))
    }
}
