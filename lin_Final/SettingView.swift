//
//  ProfileView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/19.
//

import SwiftUI
import PhotosUI
struct SettingView: View {
    @EnvironmentObject var loginData:Login
    @EnvironmentObject var language:Language
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("SETTING").bold()
                List{
                    AvatarView()
//                    Button(action: {
//                        language.data = "en"
//                    }, label: {
//                        Text("English")
//                    })
//                    Button(action: {
//                        language.data = "zh-Hant"
//                    }, label: {
//                        Text("Chinese")
//                    })
                    ShareButton()
                    SignOutButton()
                }
                
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
