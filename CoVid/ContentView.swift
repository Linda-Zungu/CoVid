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
        ScrollView{
            VStack{
                ZStack{
                    VStack{
                        MyImageView(imageName: "use_mask_black_woman1-1")
                            .cornerRadius(checkHeight() ? 30: 0)

                        Spacer()
                    }
                    
                    Button(action: {
                        print("Tap")
                    }, label: {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 250, height: 60, alignment: .center)
                            .shadow(radius: 20, y: 12)
                            .foregroundColor(.white)
                        .overlay(
                            Text("South Africa")
                                .font(.headline)
                                .shadow(radius: 5, y: 6)
                        )
                    })
                    VStack{
                        SummaryView()
                            .padding(.top, 250)
                    }
                }
                Spacer(minLength: checkHeight() ? 23/100*(UIScreen.main.bounds.height): 45)
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func checkHeight() -> Bool{
        return UIScreen.main.bounds.height > 750
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
