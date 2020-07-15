//
//  MyImageView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct MyImageView: View {
    var imageName: String
    var body: some View {
        Image("use_mask_black_woman1-1")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(imageName: "use_mask_black_woman1-1")
    }
}
