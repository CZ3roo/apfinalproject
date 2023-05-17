//
//  ModelData.swift
//  newAPCSPPROJECT
//
//  
//

import Foundation

/// data
///
//data menu items
var foodCategories: [FoodCategory] = [
    FoodCategory(name: "Appetizers",
                 food: [Food(name: "Bread", price: 3.00, numOrdered: 1, calories: 87, image: "bread",description: "Whole wheat bread"),
                        Food(name: "Calamari", price: 7.99, numOrdered: 1, calories: 470, image: "calamari",description: "Calamari rings breaded and fried until golden. Served with julienned fennel and cocktail sauce."),
                        Food(name: "Chips and Salsa", price: 5.00, numOrdered: 1, calories: 390, image: "chipsandsalsa",description: "Extra thin corn tostada chips served with salsa.")]),
    FoodCategory(name: "Soups and Salads",
                 food: [Food(name: "Caesar Salad", price: 5.99, numOrdered: 1, calories: 180, image: "caesarsalad",description: "Hearts of Romaine Tossed in Caesar Dressing. Topped with Herbed Croutons and Parmesan Cheese."),
                        Food(name: "Seaweed Salad", price: 4.99, numOrdered: 1, calories: 150, image: "seaweedsalad",description: "Seaweed Salad mixed with cucumber tossed in soy, sesame and lemon juice"),
                        Food(name: "Tomato Soup", price: 8.99, numOrdered: 1, calories: 340, image: "tomatosoup", description: "Fresh tomato soup made using our own secret recipe.")]),
                       
    FoodCategory(name: "Fish",
                 food: [Food(name: "Salmon Nigiri", price: 12.99, numOrdered: 1, calories: 358, image: "salmonnigiri",description: "Ball of vinegared sushi rice topped with a slice of salmon.")]),
                       
    FoodCategory(name: "Chicken",
                 food: [Food(name: "Chicken Salad Sandwich", price: 11.99, numOrdered: 1, calories: 367, image: "chickensaladsandwich",description: "Chicken Salad combined with diced pineapples and gfapes and served on a warm, toasted sweet bun.")])
]

//Valid Coupon code
let validCouponCode = "APCSP"
