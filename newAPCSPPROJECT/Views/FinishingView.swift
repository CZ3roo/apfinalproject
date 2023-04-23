//
//  FinishingView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/28/23.
//

import SwiftUI

struct FinishingView: View {
    @EnvironmentObject var menuManager: MenuManager
    
    @State var totalCost = 0
    @State private var coupon = ""
    @State private var finalPrice = FinalPrice()
    @State private var couponText = ""
    var body: some View {
        VStack{
            if (!menuManager.chosenFoods.isEmpty){
              //  HStack{
                  //  Spacer()
                    Text("Enter your coupon code: ")
                    TextField("Input coupon code", text: $coupon)
                        .font(.custom(
                            "SF Pro",
                            fixedSize: 18))
                        .disableAutocorrection(true)
                    Button(action: {
                        couponText = menuManager.validateCouponCode(couponCode: coupon)
                        finalPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods,couponCode: coupon)
                    }) {
                        Text("Apply")
                            .font(.custom(
                                "SF Pro",
                                fixedSize: 20))
                            .foregroundColor(.orange)
                    }
               //     Spacer()
             //   }
                
                Text(couponText)
                    .foregroundColor(finalPrice.moneySaved == 0 ? .red: .black)
            
            /*
                if finalPrice.moneySaved == 0{
                    .foregroundColor(.red)
                }
                else{
                    .foregroundColor(.black)
                }
            */
                
                List{
                    ForEach(menuManager.chosenFoods) { food in
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white.opacity(0.5))
                                .frame(height: 80)
                            ZStack{
                                
                                //lijiohi
                                Button(action: {
                                    
                                        menuManager.removeFromOrder(food: food)
                                    finalPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods,couponCode: coupon)
                                }) {
                                label: do {
                                   Image(systemName: "trash.fill")
                                        .foregroundColor(.red)
                               }
                                }
                            }
                            .frame(width: 10)
                            .position(x: 320 , y: 10)
                            VStack{
                            HStack{
                                Stepper(value: $menuManager.chosenFoods[menuManager.chosenFoods.firstIndex(of: food)!].numOrdered, in: 1 ... 99){
                                    HStack{
                                        Text(food.name)
                                            .offset(x: 10)
                                        Spacer()
                                        Text ("$\(String(format: "%.2f", food.price))")
                                        Text("x " + String(food.numOrdered))
                                    }
                                   
                                }.onChange(of: menuManager.chosenFoods[menuManager.chosenFoods.firstIndex(of: food)!].numOrdered) { newValue in
                                    finalPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: coupon)
                                }
                            }
                                
                        }
                            
                        }
                    }
                }.onAppear{finalPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods,couponCode: coupon)}
                
                //       }
                Text("Total Cost: \(String(format: "%.2f" , finalPrice.totalWithDiscount))")
                    .font(.custom(
                        "SF Pro",
                        fixedSize: 20))
                Text("You Saved \(String(format: "%.2f" , finalPrice.moneySaved))")
                    .font(.custom(
                        "SF Pro",
                        fixedSize: 16 ))
                /*Text("Total Cost: \(String(format: "%.2f" , menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: coupon).totalWithDiscount))")
                Text("You Saved \(String(format: "%.2f" , menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: coupon).moneySaved))")
                 */
                NavigationView{
                    
                }
             
            }
            
            
            
            // If nothing is inside the selected food list, will show this error message
            else {
                Text("No food items have been selected. Please order from the menu")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                
            }
            
        }
    }
    struct FinishingView_Previews: PreviewProvider {
        static var previews: some View {
            FinishingView()
        }
    }
}
