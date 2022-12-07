//
//  HomeView.swift
//  lin_Final
//
//  Created by User01 on 2022/12/7.
//
//favQs apikey:
//418e36330b5982ab2ec1988d51b6574f
import SwiftUI

struct HomeView: View {
    var body: some View {
        List{
            PostRow();
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
