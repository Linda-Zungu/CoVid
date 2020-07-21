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
    @State var selectedCountry = 2
    
    @State var globalTCases = 0
    @State var globalDCases = 0
    @State var globalRCases = 0
    
    var body: some View {
        ZStack{
            Color((colorScheme == .dark) ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            ScrollView(.vertical, showsIndicators: false){
                Color((colorScheme == .dark) ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                VStack{
                    ZStack{
                        VStack{
                            if removeLaunchScreen == true {//turn back to false
                                LottieView(fileName: "20546-i-stay-at-home", loopMode: .repeat(2))
                                    .background(
                                        BlurView(style: .systemUltraThinMaterial)
                                            .cornerRadius(checkHeight() ? 30 : 0)
                                            .shadow(radius: 30)
                                            .frame(height: (UIScreen.main.bounds.height > 735) ? 355 : 335)
                                )
                            }
                            
                            Spacer(minLength: 310)
                            Spacer(minLength: checkHeight() ? 23/100*(UIScreen.main.bounds.height) : 140)
                        }
                        
                        VStack{
                            SummaryView(globalTotalCases: globalTCases, globalDeathCases: globalDCases, globalRecoveredCases: globalRCases)
                                .padding(.top, (checkHeight()) ? 340 : 385)
                        }
                        .padding(.vertical, checkHeight() ? 20 : -40)
                        
                        Button(action: {
                            self.show.toggle()
                        }, label: {
                            ZStack{
                                Text((summary.count > 0) ? summary[selectedCountry].Country : "World")
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
                                    
                                }
                            }
                        })
//                            .animation(.easeInOut)
                            .animation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9))
                            .padding(.bottom, (checkHeight()) ? /*179 : 135*/ 153 : 105)//position of the country button on the ZStack
                    }
                }
            }
            
//            StartupView()
//                .frame(height: removeLaunchScreen ? UIScreen.main.bounds.height : 0)
//                .opacity(removeLaunchScreen ? 1 : 0)
//                .animation(Animation.easeInOut(duration: 0.8))
//                .onAppear(perform: remove)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: loadData)
        
    }
    
    func checkHeight() -> Bool{
        return UIScreen.main.bounds.height > 740
    }
    
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
//                        print(self.summary[0].TotalConfirmed)
                        for i in 0...self.summary.count-1{
                            self.globalTCases += self.summary[i].TotalConfirmed
                            self.globalDCases += self.summary[i].TotalDeaths
                            self.globalRCases += self.summary[i].TotalRecovered
                        }
                        print(self.globalTCases)
                    }
                    return
                }
            }
        }.resume()
    }
    
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
