//
//  SettingsView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/31/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            Form{
//                Section(header: Text("STUFF")){
//                    Picker(selection: $chooseDefaultCountry, label: Text("Choose Default Country")){
//                        ForEach(0..<)
//                    }
//                }
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
        SettingsView()
    }
}
