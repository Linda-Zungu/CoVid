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
                HStack{
                    VStack(alignment: .leading, spacing: nil){
                        Text("Wash Your Hands")
                            .font(.headline)
                        Spacer()
                        Text("Practice Physical Distancing")
                            .font(.headline)
                        Spacer()
                        Text("Quarantine")
                            .font(.headline)
                        Spacer()
                        Text("Avoid Touching Your Face")
                            .font(.headline)
                        Spacer()
                        Text("Wear a Mask!")
                            .font(.headline)
                    }
                    .padding()
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            .navigationBarTitle("Precautions")
        }
    }
}

struct PrecautionsView_Previews: PreviewProvider {
    static var previews: some View {
        PrecautionsView()
    }
}
