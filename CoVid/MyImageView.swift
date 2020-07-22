//
//  MyImageView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct MyImageView: View {
    var imageName = "use_mask_black_woman1-1"
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(imageName: "use_mask_black_woman1-1")
    }
}
