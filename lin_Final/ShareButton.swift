//
//  ShareButton.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

import SwiftUI

struct ShareButton: View {
    @State private var isShowSharer = false
    var body: some View {
        HStack
        {
            Spacer()
            Button(action: {
                self.isShowSharer = true
            }) {
                HStack {
                    Text("Share Creator's Github")
                }
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .padding()
            }.sheet(isPresented: $isShowSharer) {
                Sharer(url: URL(string: "https://github.com/0-ch")!)
            }
            Spacer()
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
