//
//  SummaryView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .padding()
            .frame(height: 150)
            .foregroundColor(Color.init(.secondarySystemFill))
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
