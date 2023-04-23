//
//  MenuModel.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/27/23.
//

import Foundation

    struct Food: Hashable, Identifiable {
        var name: String
        var price: Double
        var numOrdered: Int
        var calories: Int
        var image: String
        var id = UUID()
    }

    struct FoodCategory: Identifiable {
        var name: String
        var food: [Food]
        var id = UUID()
    }
struct FinalPrice: Hashable{
    var isCouponUsed: Bool = false
    var orderSubtotal: Double = 0
    var moneySaved: Double = 0
    var totalWithDiscount: Double = 0
    
}


