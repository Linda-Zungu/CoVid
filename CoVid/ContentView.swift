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
    
    var body: some View {
        ZStack{
            Color((colorScheme == .dark) ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            ScrollView{
                VStack{
                    ZStack{
                        VStack{
                            LottieView(fileName: "20546-i-stay-at-home")
                                .background(
                                    BlurView(style: .systemUltraThinMaterial)
                                        .cornerRadius(checkHeight() ? 30 : 0)
                                        .shadow(radius: 30)
                                        .frame(height: (UIScreen.main.bounds.height > 735) ? 355 : 335)
                                )
                                .padding(.bottom, 26)

                            Spacer(minLength: 310)
                            Spacer(minLength: checkHeight() ? 23/100*(UIScreen.main.bounds.height) : 140)
                        }
                        VStack{
                            SummaryView()
                                .padding(.top, (checkHeight()) ? 30 : 75)
                        }
                        
                        Button(action: {
                            print("Tap")
                            self.show.toggle()
                        }, label: {
                            Text("South Africa")
                                .padding(.bottom, show ? 0 : 280)
                                .frame(width: show ? 100 : UIScreen.main.bounds.width-130, height: show ? 20 : 320)
                                .font(.headline)
                                .foregroundColor((colorScheme == .dark) ? .white : .black)
                                .padding()
                                .padding(.horizontal, 30)
                                .background(
                                    BlurView(style: .systemUltraThinMaterial)
                                        .cornerRadius(40)
                                        .shadow(radius: 30, y: 7)
                                )
                                .padding(.bottom, (checkHeight()) ? 180 : 135)
                        })
                        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5))
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
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
//                        print(self.summary[0].Country)
//                        for i in 0...self.summary.count-1{
//                            self.Cou
//                        }
                    }
                    return
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}
