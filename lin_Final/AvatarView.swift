//
//  AvatarView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/20.
//

import SwiftUI

struct AvatarView: View {
    @EnvironmentObject var loginData:Login
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Text("")
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    .background(Circle())
                    .clipShape(Circle())
                Text(loginData.login).padding()
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Change Avatar")
                            .font(.headline)
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }.sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
                
                
            }
            Spacer()
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
