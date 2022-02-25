//
//  ColorsUI.swift
//  TestingPath
//
//  Created by Leandro Hernandez on 21/2/22.
//

import SwiftUI

extension Color {
    
    static let ui = Color.UI()
    static let gradient = Color.Gradient()
    
    struct UI {
        let blueDeFrance    = Color("BlueDeFrance")
        let vividSkyBlue    = Color("VividSkyBlue")
        let maximumRed      = Color("MaximumRed")
        let tartOrange      = Color("TartOrange")
        let grayX           = Color("GrayX")
        let lightGray       = Color("LightGray")
        let cultured        = Color("Cultured")
    }
    
    struct Gradient {
        let from            = Color("fromColor")
        let to              = Color("toColor")
    }
}

