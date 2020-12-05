//
//  ContentView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct Response: Codable{
    var Countries : [Countries]
}

struct Countries: Codable{
    var Country: String
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
    var Date: String
    var CountryCode: String
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var summary = [Countries]()
    @State var show = true
    @State var removeLaunchScreen = true
    @State var selectedCountry = UserSettings().selectedCountry
    
    @State var globalTCases = 0
    @State var globalDCases = 0
    @State var globalRCases = 0
    
    @State var countRefreshes = 1
    
    @State var tabSelection = 2
    
    let randomTipNumber = Int.random(in: 1...7)
    var body: some View {
        ZStack{
            TabView(selection: $tabSelection){
                PrecautionsView()
                    .tabItem {
                        Image(systemName: "staroflife")
                            .font(.system(size: 25))
                        Text("Precautions")
                }
                .tag(1)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading){
                        ZStack(alignment: .center){
                            VStack{
                                if removeLaunchScreen == false {
                                    BlurView(style: .systemUltraThinMaterial)
                                        .frame(height: checkHeight() ? 330 : 280)
                                        .cornerRadius(checkHeight() ? 30 : 0)
                                        .shadow(radius: 30)
                                        .overlay(
                                            LottieView(fileName: "20546-i-stay-at-home", loopMode: .repeat(2))
                                    )
                                }
                                
                                if summary.count > 0 {
                                    CountrySummaryView(countryTotalCases: summary[selectedCountry].TotalConfirmed, countryDeathCases: summary[selectedCountry].TotalDeaths, countryRecoveredCases: summary[selectedCountry].TotalRecovered, countryNewTotalCases: summary[selectedCountry].NewConfirmed, countryNewDeathCases: summary[selectedCountry].NewDeaths, countryNewRecoveriesCases: summary[selectedCountry].NewRecovered)
                                        .padding(.top, 20)
                                }
                                else{
                                    CountrySummaryView(countryTotalCases: 0, countryDeathCases: 0, countryRecoveredCases: 0, countryNewTotalCases: 0, countryNewDeathCases: 0, countryNewRecoveriesCases: 0)
                                        .padding(.top, 20)
                                }
                                
                                SummaryView(globalTotalCases: globalTCases/(self.countRefreshes), globalDeathCases: globalDCases/(self.countRefreshes), globalRecoveredCases: globalRCases/(self.countRefreshes))
                                
                                RandomTipView(tipNumber: randomTipNumber)
                            }
                            Button(action: {
                                if self.summary.count > 0 {
                                    self.show.toggle()
                                }
                                else{
                                    self.countRefreshes += 1
                                    self.loadData()
                                }
                            }, label: {
                                ZStack{
                                    Text((summary.count > 0) ? summary[selectedCountry].Country : "Refresh")
                                        .padding(.bottom, show ? 0 : 250)
                                        .frame(minWidth: show ? .leastNonzeroMagnitude+130 : UIScreen.main.bounds.width-190, maxWidth: show ? UIScreen.main.bounds.width : UIScreen.main.bounds.width-190, minHeight: 0, maxHeight: 270)
                                        .font(.headline)
                                        .foregroundColor((colorScheme == .dark) ? .white : .black)
                                        .padding()
                                        .padding(.horizontal, 30)
                                        .fixedSize()
                                        .background(
                                            BlurView(style: .systemUltraThinMaterial)
                                                .cornerRadius(40)
                                                .shadow(radius: 30, y: 7)
                                                .padding(.horizontal, show ? 20 : -22)
                                    )
                                        .multilineTextAlignment(.center).lineLimit(1).minimumScaleFactor(0.6)
                                    
                                    if show == false{
                                        Picker(selection: $selectedCountry, label: Text("Choose Country"), content: {
                                            ForEach(0..<summary.count) {
                                                Text(self.summary[$0].Country)
                                            }
                                        })
                                            .labelsHidden()
                                            .opacity(show ? 0 : 1)
                                        .frame(width: UIScreen.main.bounds.width/2)
                                    }
                                }
                            })
                                .animation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9))
                                .padding(.bottom, checkHeight() ? 370 : 420)
                            .padding(.top, -140)
                        }
                        Spacer(minLength: 30)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image(systemName: "doc.richtext")
                        .font(.system(size: 25))
                    Text("Summary")
                }
                .tag(2)
                
                SettingsView(summary: summary)
                .tabItem({
                    Image(systemName: "gear")
                        .font(.system(size: 25))
                    Text("Settings")
                })
                .tag(3)
            }
            .accentColor(.orange)
            
            StartupView()
                .frame(height: removeLaunchScreen ? UIScreen.main.bounds.height : 0)
                .opacity(removeLaunchScreen ? 1 : 0)
                .animation(Animation.easeInOut(duration: 0.8))
                .onAppear(perform: remove)
        }
        .onAppear(perform: loadData)
    }
    
    //MARK: Check Height
    func checkHeight() -> Bool{
        return UIScreen.main.bounds.height > 740
    }
    
    //MARK: Load Data
    func loadData(){
        guard let url = URL(string: "https://api.covid19api.com/summary") else {
            print("Invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    
                    DispatchQueue.main.async {
                        self.summary = decodedResponse.Countries
                        print(summary)
                        print(self.summary.count)
                        for i in 0..<self.summary.count{
                            if self.summary[i].Country == "South Africa"{
                                print("SA:",i)
                            }
                            self.globalTCases += self.summary[i].TotalConfirmed
                            self.globalDCases += self.summary[i].TotalDeaths
                            self.globalRCases += self.summary[i].TotalRecovered
                        }
                        print("TC:",self.globalTCases)
                    }
                    return
                }
            }
        }.resume()
    }
    
    //MARK: Launch Screen
    func remove(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1.6){
            self.removeLaunchScreen.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.colorScheme(.dark)
    }
}
