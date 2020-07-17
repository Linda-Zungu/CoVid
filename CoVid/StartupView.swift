//
//  StartupView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/17/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct StartupView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white)
            
            LottieView(fileName: "17801-stay-at-home")
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
