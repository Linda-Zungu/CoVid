//
//  StartupView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/17/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct StartupView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor((colorScheme == .dark) ? .black : .white)
                .overlay(
                    BlurView(style: .systemUltraThinMaterialDark)
                        .edgesIgnoringSafeArea(.all)
            )
            
            LottieView(fileName: "17856-defender-coronavirus", loopSpeed: 2)
            .frame(width: 70)
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
