//
//  PrecautionsView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/31/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI

struct PrecautionsView: View {
    
    var precautions = [
        "Follow these steps to wash your hands properly:\n\n1. Wet hands with running water.\n\n2. Apply enough soap to cover wet hands.\n\n3. Scrub all surfaces of the hands — including the back of hands, between fingers and under nails — for at least 20 seconds.\n\n4. Rinse thoroughly with running water.\n\n5. Dry hands with a clean cloth, single-use towel or blow-drier.",
        "The virus spreads from person to person. Physical distancing means putting space between yourself and people outside your home to prevent the transmission of the disease.\n\n- Avoid physical contact with other people.\n\n- Stay at least 6 feet away from people when outside your house. This includes friends or loved ones. Same goes for other people’s pets.\n\n- Do not invite guests to your home.\n\n- Avoid groups and crowds.\n\n- In places where physical distancing might be difficult, like the grocery store or pharmacy, do your best to stay 6 feet away from others. Wear a cloth face covering.\n\n- Physical distancing does not mean you shouldn’t talk to others. Make sure you stay connected with your friends, family, and neighbors. Call, video chat, or stay connected using social media.",
        "If you think you might have been exposed to COVID‑19, quarantine yourself. The purpose of this practice is to separate yourself from others and restrict your movement while waiting to see if you become sick.\n\n- Stay home for 14 days after your suspected exposure.\n\n- Monitor your symptoms. Contact your doctor immediately if symptoms develop.\n\n- Try to minimize contact with others, including household members and pets. Be particularly mindful of staying away from those who are high risk for getting very sick from COVID‑19.\n\n- Wash your hands frequently.\n\n- If you cough or sneeze, cover your mouth and nose with a tissue. Discard the tissue and immediately wash your hands.\n\n- Avoid sharing personal items such as dishes, towels, and bedding with other people in your house\n\n- Clean and disinfect frequently used surfaces often, like doorknobs and countertops.\n\n- Have a household member or friend run errands for you like picking up groceries or prescriptions, or get items delivered. If you do have to go out, practice physical distancing.",
        "Commonly used surfaces should be regularly cleaned and disinfected.\n\nIt’s always a good idea to routinely clean and disinfect frequently touched surfaces like tables, doorknobs, light switches, handles, desks, toilets, faucets, and sinks. But if you have a suspected or confirmed case of COVID‑19, be vigilant about doing this daily.\n\n-First, clean dirty surfaces with soap and water. Cleaning will remove dirt and lower the number of germs—but it will not kill germs.\n\n-Next, disinfect surfaces to kill germs. Disinfecting after cleaning can further lower the risk of spreading an infection. Most common EPA-registered household disinfectants will work. Or dilute your household bleach with 1/3 cup of bleach per gallon of water.\n\n-Wear dedicated gloves for COVID‑19 related cleaning and disinfecting or use disposable gloves and discard them after each use.",
        "Using a cloth mask can protect yourself and others from germs and help slow the spread.\n\nBuy a cloth face mask. If you can’t find one, improvise. Create a mask from a tightly‑woven cotton garment, like sheets or a bandana; T‑shirt fabric will work in a pinch. Ensure your mask has multiple layers of fabric. Tap the button below to view the CDC’s full instructions.\n\n-Wear your mask over your mouth and nose. Make sure it fits snugly but comfortably against the side of your face. It should have ear loops or tie in the back.\n\n-Wear your mask in public, especially in places where it’s hard to practice physical distancing, like grocery stores or pharmacies.\n\n-When you remove the mask, take it off carefully without touching your eyes, nose, or mouth. Wash your hands immediately.\n\n-To sanitize your mask, routinely wash it in the washing machine in hot water.\n\n-Don’t use a cloth mask on children under the age of 2, on anyone who has trouble breathing, or on someone who can’t voluntarily take the mask off.\n\n-Don’t use surgical or N95 masks. Healthcare workers and other medical first responders need these masks for protection.\n\n-If you are an essential worker who has been directly exposed to COVID‑19 or has had direct contact with someone known to have COVID‑19, wear a face mask at work for 14 days after exposure."
    ]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Wash Your Hands")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(.systemOrange))
                    Text(precautions[0])
                        .padding()
                }
                
                Section{
                    Text("Practice Physical Distancing")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(.systemOrange))
                    Text(precautions[1])
                        .padding()
                }
                
                Section{
                    Text("Quarantine")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(.systemOrange))
                    Text(precautions[2])
                        .padding()
                }
                
                Section{
                    Text("Clean & Disinfect Surfaces")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(.systemOrange))
                    Text(precautions[3])
                        .padding()
                }
    
                Section{
                    Text("Wear a Mask!")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(.systemOrange))
                    Text(precautions[4])
                        .padding()
                }
            }
            .navigationBarTitle("Precautions")
        }
    }
}

struct PrecautionsView_Previews: PreviewProvider {
    static var previews: some View {
        PrecautionsView()
    }
}
