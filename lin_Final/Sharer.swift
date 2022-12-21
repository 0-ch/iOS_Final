//
//  Sharer.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

import Foundation
import UIKit
import SwiftUI
import SafariServices
struct Sharer:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {

    }
//    func makeUIViewController(context: Context) -> SFSafariViewController {
//        SFSafariViewController(url: url)
//    }
//
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
//
//    }
//    typealias UIViewControllerType = SFSafariViewController
    
    typealias UIViewControllerType = UIActivityViewController
    
    let url:URL
}

struct Sharer_Previews: PreviewProvider {
    static var previews: some View {
        Sharer(url: URL(string: "https://medium.com/@apppeterpan")!)
    }
}
