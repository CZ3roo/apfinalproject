//
//  ModelData.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/28/23.
//

import Foundation
//let couponCode = "1234"
var foodCategories: [FoodCategory] = [
    FoodCategory(name: "Appetizers",
                 food: [Food(name: "Bread", price: 3.00, numOrdered: 1, calories: 1, image: "bread"),
                        Food(name: "Calamari", price: 7.99, numOrdered: 1, calories: 1, image: "calamari"),
                        Food(name: "Chips and Salsa", price: 5.00, numOrdered: 1, calories: 1, image: "chipsandsalsa")]),
    FoodCategory(name: "Soups and Salads",
                 food: [Food(name: "Caesar Salad", price: 5.99, numOrdered: 1, calories: 1, image: "caesarsalad"),
                        Food(name: "Seaweed Salad", price: 4.99, numOrdered: 1, calories: 1, image: "seaweedsalad"),
                        Food(name: "Tomato Soup", price: 99.99, numOrdered: 1, calories: 1, image: "tomatosoup")]),
                       
    FoodCategory(name: "Fish",
                 food: [Food(name: "Salmon Nigiri", price: 12.99, numOrdered: 1, calories: 1, image: "salmonnigiri")]),
                       //[Food(name: "Fish Balls", price: 1, numOrdered: 1, calories: 1, image: "salmonnigiri")])
    FoodCategory(name: "Chicken",
                 food: [Food(name: "Chicken Salad Sandwich", price: 8.99, numOrdered: 1, calories: 1, image: "chickensaladsandwich")]),
                    
]
let validCoupon = "APCSP"
