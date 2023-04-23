//
//  StepperView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/30/23.
//

import SwiftUI

struct StepperView: View {
    @EnvironmentObject var menuManager: MenuManager
    @State var food: Food
    
    var body: some View {
        HStack {
            Text(food.name)
            Spacer()
            Stepper(value: $food.numOrdered, in: 0...10) {
                Text("x \(food.numOrdered)")
            }
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(food: Food(name: "Thing", price: 99, numOrdered: 2, calories: 12, image: "salmonnigiri") )
    }
}


