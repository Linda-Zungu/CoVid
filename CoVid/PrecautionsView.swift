//
//  PrecautionsView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/31/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct PrecautionsView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Spacer()
                    Text("Hello World!")
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            .navigationBarTitle("Precautions", displayMode: .automatic)
        }
    }
}

struct PrecautionsView_Previews: PreviewProvider {
    static var previews: some View {
        PrecautionsView()
    }
}
