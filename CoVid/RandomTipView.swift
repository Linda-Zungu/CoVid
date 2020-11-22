//
//  RandomTipView.swift
//  CoVid
//
//  Created by Linda Zungu on 11/22/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct RandomTipView: View {
    
    var tipNumber: Int
    
    var body: some View {
        BackgroundSubView(backgroundHeight: 102)
            .overlay(
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Group{
                        Image(systemName: getSysmbolName(tip: findTip()))
                            .font(.system(size: 24.0))
                            .foregroundColor(changeSymbolColor(tipNumber: tipNumber))
                        Text(findTip())
                    }
                    .padding(.all, 7)
                })
            )
    }
    
    func findTip() -> String{
        if(tipNumber == 1){
            return "Wash your hands"
        }
        else if(tipNumber == 2){
            return "Practice physical distancing"
        }
        else if(tipNumber == 3){
            return "Quarantine"
        }
        else if(tipNumber == 4){
            return "Avoid touching your face"
        }
        else if(tipNumber == 5){
            return "Do symptom monitoring"
        }
        else if(tipNumber == 6){
            return "Clean and disinfect surfaces"
        }
        else{
            return "Wear a face mask"
        }
    }
    
    func getSysmbolName(tip : String) -> String{
        if(tip == "Wash your hands"){
            return "hands.sparkles.fill"
        }
        else if(tip == "Practice physical distancing"){
            return "figure.stand.line.dotted.figure.stand"
        }
        else if(tip == "Quarantine"){
            return "house.fill"
        }
        else if(tip == "Avoid touching your face"){
            return "hand.raised.slash.fill"
        }
        else if(tip == "Do symptom monitoring"){
            return "thermometer"
        }
        else if(tip == "Clean and disinfect surfaces"){
            return "sparkles"
        }
        else{
            return "shield.lefthalf.fill"
        }
    }
    
    func changeSymbolColor(tipNumber : Int) -> Color{
        if(tipNumber == 1){
            return Color.init(.systemGreen)
        }
        else if(tipNumber == 2){
            return Color.init(.systemPurple)
        }
        else if(tipNumber == 3){
            return Color.init(.systemRed)
        }
        else if(tipNumber == 4){
            return Color.init(.systemBlue)
        }
        else if(tipNumber == 5){
            return Color.init(.systemOrange)
        }
        else if(tipNumber == 6){
            return Color.init(.systemYellow)
        }
        else{
            return Color.init(.gray)
        }
    }
    
}

struct RandomTipView_Previews: PreviewProvider {
    static var previews: some View {
        RandomTipView(tipNumber: 2)
            .previewLayout(.sizeThatFits)
    }
}
