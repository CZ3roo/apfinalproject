//
//  ButtonView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 5/16/23.
//

import SwiftUI


struct MenuButton: View {

    var buttonText: String
    var length: CGFloat
    var body: some View

    
    {
 
            Text(buttonText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: length)
                .background( LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.red]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
                .cornerRadius(25)
        }
    }


struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(buttonText: "add to order", length: 800)
    }
}
