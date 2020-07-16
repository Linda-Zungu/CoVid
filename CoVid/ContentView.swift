//
//  ContentView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/15/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    ZStack{
                        VStack{
                            LottieView(fileName: "20546-i-stay-at-home")
                                .background(
                                    BlurView(style: .systemUltraThinMaterialLight)
                                        .cornerRadius(checkHeight() ? 30: 0)
                                        .shadow(radius: 30)
                                        .frame(height: (UIScreen.main.bounds.height > 735) ? 355 : 335)
                                )
                                .padding(.bottom, 26)

                            Spacer(minLength: 310)
                            Spacer(minLength: checkHeight() ? 23/100*(UIScreen.main.bounds.height): 140)
                        }
                        
                        Button(action: {
                            print("Tap")
                        }, label: {
                            Text("South Africa")
                                .font(.headline)
                                .padding()
                                .padding(.horizontal, 30)
                                .background(
                                    BlurView(style: .systemUltraThinMaterialLight)
                                        .cornerRadius(40)
                                        .shadow(radius: 30, y: 7)
                                )
                                .padding(.bottom, (checkHeight()) ? 180 : 135)
                        })
                        
                        VStack{
                            SummaryView()
                                .padding(.top, (checkHeight()) ? 30 : 75)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func checkHeight() -> Bool{
        return UIScreen.main.bounds.height > 740
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
