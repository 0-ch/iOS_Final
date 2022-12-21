//
//  configureBackground.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//

import Foundation
import SwiftUI

func configureBackground(){
    let barAppearance = UINavigationBarAppearance()
    
    barAppearance.configureWithTransparentBackground()
    
    UINavigationBar.appearance().standardAppearance = barAppearance
    
    UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    
}
