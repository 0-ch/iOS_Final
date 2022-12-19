//
//  ProfileView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/19.
//

import SwiftUI
import PhotosUI
struct ProfileView: View {
    @EnvironmentObject var loginData:Login
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("PROFILE").bold()
                List{
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
                            Text(loginData.login).padding()
                            Button(action: {
                                self.isShowPhotoLibrary = true
                            }) {
                                HStack {
                                    Image(systemName: "photo")
                                        .font(.system(size: 20))
                                    
                                    Text("更換大頭貼")
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
                            
                            //                            Button(action: {
                            //                                loginData.token=""
                            //                            }, label: {
                            //                                Text("登出")
                            //                            })                .frame(width: 100, height: 50, alignment: .center)
                            //                            .foregroundColor(.white)
                            //                            .background(Color.red)
                            //                            .cornerRadius(40)
                            //                            .padding()
                        }
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
