//
//  PostView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/19.
//

import SwiftUI
import AlertX
struct NewPostView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("NEW POST").bold()
                List{
                    VStack {
                        Spacer()
                        if downloadAmount < 100 {
                            ProgressView("Loading...", value: downloadAmount, total: 100)
                                .onReceive(timer) { _ in
                                    if downloadAmount < 100 {
                                        downloadAmount += 2
                                    }
                                }
                                .padding()}
                        else if downloadAmount > -1
                        {
                            AlertX(title: Text("Please remit USD 1,000 to (812) 2888-10-1172686-7 to upgrade to a premium account and use the posting function"), theme: .sun(withTransparency: true, roundedCorners: true),
                                    animation: .classicEffect())
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
