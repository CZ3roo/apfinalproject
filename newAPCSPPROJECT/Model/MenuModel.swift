//
//  MenuModel.swift
//  newAPCSPPROJECT
//
//
//

import Foundation

//struc to hold food information
    struct Food: Hashable, Identifiable {
        var name: String
        var price: Double
        var numOrdered: Int
        var calories: Int
        var image: String
        var id = UUID()
        var description: String
        

        //initialize Food object using customized values
        init(name: String = "Default", price: Double = 0.0, numOrdered: Int = 0, calories: Int = 0, image: String = "", description: String = "") {
               self.name = name
               self.price = price
               self.numOrdered = numOrdered
               self.calories = calories
               self.image = image
               self.description = description
           }
    }

//group food by food category
    struct FoodCategory: Identifiable {
        var name: String
        var food: [Food]
        var id = UUID()
    }

//struc to hold pricing information of order
struct OrderPricing: Hashable{
    var isCouponUsed: Bool
    var orderSubtotal: Double
    var moneySaved: Double
    var totalWithDiscount: Double
    
    //initialize
    init(isCouponUsed: Bool = false, orderSubtotal: Double = 0, moneySaved: Double = 0, totalWithDiscount: Double = 0) {
          self.isCouponUsed = isCouponUsed
          self.orderSubtotal = orderSubtotal
          self.moneySaved = moneySaved
          self.totalWithDiscount = totalWithDiscount
      }
    
}


