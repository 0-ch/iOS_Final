//
//  SearchView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/19.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .trailing, endPoint: .leading).ignoresSafeArea()
            VStack{
                Text("SEARCH").bold()
                List{
                    
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
