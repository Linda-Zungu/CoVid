//
//  UserSettings.swift
//  CoVid
//
//  Created by Linda Zungu on 12/5/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//
//  NB: This class is for settings and setting up user defaults so that users can set their own default settings and the app can remember them.

import Foundation
import Combine

class UserSettings: ObservableObject{
    @Published var selectedCountry: Int{
        didSet{
            UserDefaults.standard.set(selectedCountry, forKey: "selectedCountry")
        }
    }
    
    init() {
        self.selectedCountry = UserDefaults.standard.integer(forKey: "selectedCountry") 
    }
}
