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
            .foregroundColor(Color.init(.quaternarySystemFill))
            .overlay(
                HStack(alignment: .center){
                    VStack{
                        Text("Total Cases")
                        Text("1457")
                            .bold()
                            .font(.system(size: 25))
                            .padding()
                    }
                    .padding()
                    
                    VStack{
                        Text("New")
                        Text("21")
                            .bold()
                            .font(.system(size: 25))
                            .padding()
                    }
                    .padding()
                    
                    VStack{
                        Text("Recovered")
                        Text("4576")
                            .bold()
                            .font(.system(size: 25))
                            .padding()
                    }
                    .padding()
    //                .padding(.leading)
                }
            )
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().previewLayout(.sizeThatFits)
    }
}
