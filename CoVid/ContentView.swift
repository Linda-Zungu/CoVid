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
                        Text("South Africa")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal, 30)
                            .background(BlurView(style: .systemMaterial))
                            .cornerRadius(40)
                            .shadow(radius: 25, y: 8)
                    })
                    
                    VStack{
                        SummaryView()
                            .padding(.top, 250)
                    }
                    
                    LottieView(fileName: "TwitterHeart")
                        .background(BlurView(style: .systemMaterial))
                        .padding()
                        .cornerRadius(100)
                    
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
