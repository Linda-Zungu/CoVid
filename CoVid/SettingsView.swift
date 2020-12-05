//
//  SettingsView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/31/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var summary : [Countries]
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("COUNTRY")){
                    Picker(selection: $userSettings.selectedCountry, label:
                            HStack{
                                Text("Default Country")
                                Spacer()
                                Text(summary.count == 0 ? "0" : "\(summary[userSettings.selectedCountry].Country)")
                                    .padding(.horizontal)
                            }
                           , content: {
                            ForEach(0..<self.summary.count){
                                Text("\(self.summary[$0].Country)")
                            }
                           })
                        .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("ABOUT")){
                    HStack{
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(summary: [Countries.init(Country: "cool", NewConfirmed: 1, TotalConfirmed: 2, NewDeaths: 2, TotalDeaths: 2, NewRecovered: 2, TotalRecovered: 2, Date: "", CountryCode: "1")])
    }
}
