//
//  MenuManager.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/27/23.
//

import Foundation
import SwiftUI
class MenuManager: ObservableObject{
    
    @Published var chosenFoods: [Food] = []
   
    //initialize
    init(){
        chosenFoods = []
      //  chosenFoods = [Food(name: "Bread", price: 3.00, numOrdered: 1, calories: 1, image: "bread")]
    }
    
    func addToOrder(food: Food){
       
        if let i = chosenFoods.firstIndex(where: {$0.id == food.id}){
            chosenFoods[i].numOrdered += food.numOrdered
        }
        else{
            chosenFoods.append(food)
        }
    }
    
    func removeFromOrder(food: Food){
        
    
        if let index = chosenFoods.firstIndex(of: food) {
            chosenFoods.remove(at: index)
        }
    }
     
    func calcTotalCost(foods: [Food], couponCode: String)-> FinalPrice{
        
        var total: FinalPrice = FinalPrice()
        var totalNumOrdered: Int = 0
        var cheapestItemPrice: Double = 0.0
        var totalCost: Double = 0.0
        total.isCouponUsed = couponCode.uppercased() == validCoupon
        
        if (foods.isEmpty)
        {
            return total
        }
        
        if total.isCouponUsed{
            cheapestItemPrice = Double.infinity
        }
        
        for i in 0...foods.count - 1{
            let currentGroupTotal = Double(foods[i].numOrdered) * foods[i].price
            totalCost += currentGroupTotal
            if total.isCouponUsed && foods[i].price < cheapestItemPrice{
                cheapestItemPrice = foods[i].price
                }
            totalNumOrdered += foods[i].numOrdered
        }
        total.orderSubtotal = Double(round(100 * totalCost) / 100)
        if totalNumOrdered < 2{
            total.moneySaved = 0
            total.totalWithDiscount = total.orderSubtotal
        }
        else{
       
            total.totalWithDiscount = Double(round(100 * totalCost) / 100) - cheapestItemPrice
            total.moneySaved = cheapestItemPrice
        }
        
       
        
        return total
    }
     
    
    func validateCouponCode(couponCode: String)-> String {
      
        var couponDescription: String = ""
        
        if couponCode.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) == validCoupon
        {
            couponDescription = "Buy one or more, get one free."
        }
        else
        if (couponCode.trimmingCharacters(in: .whitespacesAndNewlines) != "")
        {
          couponDescription = "Invalid coupon"
        }
       
        return couponDescription
    }
    }

    


/*
func orderThing(x: Int){
     x = 12
}
*/
