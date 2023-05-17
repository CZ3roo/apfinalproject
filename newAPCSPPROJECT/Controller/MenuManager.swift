//
//  MenuManager.swift
//  newAPCSPPROJECT
//
//
//

import Foundation
import SwiftUI
class MenuManager: ObservableObject{
    
    @Published var chosenFoods: [Food] = []
   
    ///initialize chosenFoods array
    init(){
        chosenFoods = []
      
    }
    
    ///add order to the list of foods
    ///parameter: Food
    func addToOrder(food: Food){
       
        //if the food item is already in the list, increase the number of orders for the food item,
        if let i = chosenFoods.firstIndex(where: {$0.id == food.id}){
            chosenFoods[i].numOrdered += food.numOrdered
        }
        else{
            //if food items is not in the food list, add the food item to the list
            chosenFoods.append(food)
        }
    }
    
    ///remove food from the  order list
    ///parameter : Food
    func removeFromOrder(food: Food){
    
        if let index = chosenFoods.firstIndex(of: food) {
            chosenFoods.remove(at: index)
        }
    }
     
    ///calculate the total cost of the order,  sub total, determine the amount of money saved if a coupon code is entered. If valid coupon is used and two or more item is ordered, money saved is the price of the cheapest item
    ///parameter: [Food],list of ordered food, coupon code
    ///returns FinalPrice, finalPrice 
    func calcTotalCost(foods: [Food], couponCode: String)-> OrderPricing{
        
        var orderPricing: OrderPricing = OrderPricing()
        var totalNumOrdered: Int = 0
        var cheapestItemPrice: Double = 0.0
        var totalCost: Double = 0.0
        
        //if ordered food list is empty, get out without calculation
        if (foods.isEmpty)
        {
            return orderPricing
        }
        
        //if coupon code matches validCoupon, set isCouponUsed to true
        orderPricing.isCouponUsed = couponCode.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) == validCouponCode
        
        //if coupon is used, set cheapestItemPrice initially
        if orderPricing.isCouponUsed{
            cheapestItemPrice = Double.infinity
        }
        
        //iterate through the foods list
        for i in 0...foods.count - 1{
            let currentGroupTotal = Double(foods[i].numOrdered) * foods[i].price // calculate subtotal of each item
            
            totalCost += currentGroupTotal
            
            //Find the cheapest item. if coupon is used and the item price is less than cheapestItemPrice, set cheapestItemPrice to the current item price.
            if orderPricing.isCouponUsed && foods[i].price < cheapestItemPrice{
                cheapestItemPrice = foods[i].price
                }
            //calculate the total item on the order
            totalNumOrdered += foods[i].numOrdered
        }
        
        //total without discount
        orderPricing.orderSubtotal = Double(round(100 * totalCost) / 100)
        
        //if only one item ordered, no discount, set money saved to 0
        if totalNumOrdered < 2 || !orderPricing.isCouponUsed{
            orderPricing.moneySaved = 0
            orderPricing.totalWithDiscount = orderPricing.orderSubtotal
        }
        else{
            //discount is the price of the cheapest item
            orderPricing.totalWithDiscount = Double(round(100 * totalCost) / 100) - cheapestItemPrice
            orderPricing.moneySaved = cheapestItemPrice
        }
        
        return orderPricing
    }
     
    ///Validate coupon code
    ///parameter: String, user entered coupon code
    ///return coupon text
    func validateCouponCode(couponCode: String)-> String {
      
        var couponDescription: String = ""
        
        //validate coupon code after converting to upper case and trim spaces
        if couponCode.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) == validCouponCode
            {
            couponDescription = "Buy two or more, get one free."
            }
        else
        if (couponCode.trimmingCharacters(in: .whitespacesAndNewlines) != "")
            {
          couponDescription = "Invalid coupon"
            }
       
        return couponDescription
        }
    }

    


