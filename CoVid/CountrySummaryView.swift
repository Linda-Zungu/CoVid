//
//  CountrySummaryView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/22/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct CountrySummaryView: View {
    
    var countryTotalCases : Int
    var countryDeathCases : Int
    var countryRecoveredCases : Int
    var countryNewTotalCases : Int
    var countryNewDeathCases : Int
    var countryNewRecoveriesCases : Int
    
    var body: some View {
        BackgroundSubView(backgroundHeight: 262)
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Group{
                            Text("Total")
                                .font(.headline)
                            Text("\(countryTotalCases)")
                            
                            Text("Deaths")
                                .font(.headline)
                            Text("\(countryDeathCases)")
                            
                            Text("Recovered")
                                .font(.headline)
                            Text("\(countryRecoveredCases)")
                        }
                        .padding(.top, 7)
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.horizontal, 6)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Group{
                            Text("New Cases")
                                .font(.headline)
                            Text((countryNewTotalCases > 0) ? "+\(countryNewTotalCases)" : "\(countryNewTotalCases)")
                                .foregroundColor((countryNewTotalCases > 0) ? .red : .green)
                            
                            Text("New Deaths")
                                .font(.headline)
                            Text((countryNewDeathCases > 0) ? "+\(countryNewDeathCases)" : "\(countryNewDeathCases)")
                                .foregroundColor((countryNewDeathCases > 0) ? .red : .green)
                            
                            Text("New Recoveries")
                                .font(.headline)
                            Text((countryNewRecoveriesCases > 0) ? "+\(countryNewRecoveriesCases)" : "\(countryNewRecoveriesCases)")
                                .foregroundColor((countryNewRecoveriesCases > 0) ? .green : .red)
                        }
                        .padding(.top, 7)
                        
                        Spacer()
                    }
                    .padding()
                }
                .padding()
            )
    }
}

struct CountrySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySummaryView(countryTotalCases: 8000000000, countryDeathCases: 450, countryRecoveredCases: 230, countryNewTotalCases: 968880000000, countryNewDeathCases: 900, countryNewRecoveriesCases: 111111111000).previewLayout(.sizeThatFits)
    }
}
