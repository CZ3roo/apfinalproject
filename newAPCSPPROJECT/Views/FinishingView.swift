//
//  FinishingView.swift
//  newAPCSPPROJECT
//
// 
//

import SwiftUI
//
//  FinishingView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/28/23.
//

import SwiftUI

/// This view displays all food items user has ordered, displays total cost. User can again modify their order as well as enter a coupon code to received a discount. Total cost and discount is recalculated once order is changed.
struct FinishingView: View {
    @EnvironmentObject var menuManager: MenuManager
    
    @State var totalCost = 0
    @State private var couponCode = ""
    @State private var orderPrice = OrderPricing()
    @State private var couponText = ""
    
    var body: some View {
        NavigationView{
            VStack {

                    Text("Order Summary")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                
                Spacer()
                    .frame(height: 30)
            
                
                HStack {
                    Spacer()
                    TextField("Input coupon code here", text: $couponCode)
                        .font(.custom(
                            "SF Pro",
                            fixedSize: 18))
                        .disableAutocorrection(true)
                    
                    MenuButton(buttonText:"Apply" , length: 130)
                    Spacer()
                        .frame(width: 30)
                }
                Text(couponText)
                    .foregroundColor(orderPrice.moneySaved == 0 ? .red: .green)//if coupon can't be applied, display coupon description in red
                
                //display user-ordered food items along with a stepper and delete icon, so that user can make a final update before placing order
                if (!menuManager.chosenFoods.isEmpty) {
                    List {
                        ForEach(menuManager.chosenFoods) { food in
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(food.name)
                                            .font(.headline)
                                        Spacer()
                                        Text("$\(String(format: "%.2f", food.price))")
                                            .font(.headline)
                                    }
                                    //Use stepper for user to change number of orders for a specific food. If changed, call controller to recalculate total cost
                                    Stepper("x \(food.numOrdered)", value: $menuManager.chosenFoods[menuManager.chosenFoods.firstIndex(of: food)!].numOrdered, in: 1...99)
                                        .onChange(of: menuManager.chosenFoods[menuManager.chosenFoods.firstIndex(of: food)!].numOrdered) { newValue in
                                            orderPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: couponCode)
                                        }
                                }
                                //use trash can icon as delete button, a food item can be removed by clicking the trash can icon
                                VStack {
                                    Image(systemName: "trash.fill")
                                        .foregroundColor(.red)
                                        .frame(width: 20, height: 20)
                                }
                                .frame(width: 40, height: 80)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    //if a food item is removed, call controller to recalculate total cost
                                    menuManager.removeFromOrder(food: food)
                                    orderPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: couponCode)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .onAppear {
                        //call controll to calculate total cost first time user comes to this view.
                        orderPrice = menuManager.calcTotalCost(foods: menuManager.chosenFoods, couponCode: couponCode)
                    }
                } else {
                    List {
                        Text("No food items have been selected. Please order from the menu")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                            .frame(height: 400)
                    }
                }
                  
                Text("Total Cost: \(String(format: "%.2f", orderPrice.totalWithDiscount))")
                    .font(.custom(
                        "SF Pro",
                        fixedSize: 22))
                Text("You Saved \(String(format: "%.2f", orderPrice.moneySaved))")
                    .font(.custom(
                        "SF Pro",
                        fixedSize: 30))
                    .foregroundColor(.green)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
        
    
    struct FinishingView_Previews: PreviewProvider {
        static var previews: some View {
            FinishingView()
            
                .environmentObject(MenuManager())
        }
    }
}
