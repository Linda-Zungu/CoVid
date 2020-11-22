//
//  BackgroundSubView.swift
//  CoVid
//
//  Created by Linda Zungu on 11/22/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct BackgroundSubView: View {
    
    var backgroundHeight : CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .padding()
            .frame(height: backgroundHeight)
            .foregroundColor(Color.init(.quaternarySystemFill))
    }
}

struct BackgroundSubView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSubView(backgroundHeight: 100)
            .previewLayout(.sizeThatFits)
    }
}
