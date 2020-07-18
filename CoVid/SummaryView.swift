//
//  SummaryView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    var globalTotalCases : Int
    var globalDeathCases : Int
    var globalRecoveredCases : Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .padding()
            .frame(height: 200)
            .foregroundColor(Color.init(.quaternarySystemFill))
            .overlay(
                VStack(alignment: .leading) {
                    Text("World Statistics")
                        .font(.headline)
                        .padding()
                        
                    HStack(alignment: .center){
                        VStack{
                            Text("Cases")
                            Text("\(globalTotalCases)")
                                .bold()
                                .font(.system(size: 25))
                                .padding()
                        }
                        .padding()
                        
                        VStack{
                            Text("Deaths")
                            Text("\(globalDeathCases)")
                                .bold()
                                .font(.system(size: 25))
                                .padding()
                        }
                        .padding()
                        
                        VStack{
                            Text("Recovered")
                            Text("\(globalRecoveredCases)")
                                .bold()
                                .font(.system(size: 25))
                                .padding()
                        }
                        .padding()
        //                .padding(.leading)
                    }
                }
            )
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(globalTotalCases: 1001, globalDeathCases: 100, globalRecoveredCases: 100).previewLayout(.sizeThatFits)
    }
}
