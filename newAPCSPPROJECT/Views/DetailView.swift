//
//  DetailView.swift
//  newAPCSPPROJECT
//
//  
//

import SwiftUI

///this view displays detailed food information and allows user to select number of orders of the food item they wish to order.
struct DetailView: View {
    @EnvironmentObject var menuManager: MenuManager
    @Environment(\.dismiss) var dismiss
    @State var foodItem = Food()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 380, height: 90)
                        .foregroundColor(.clear)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.orange]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                        )
                    
                    Text(foodItem.name)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }

                Image(foodItem.image)
                    .resizable()
                    .frame(width: 360, height: 225)
                    .scaledToFit()
                    .cornerRadius(25)
            
    
                VStack{
                    Text("$\(String(format: "%.2f", foodItem.price))")
                        .font(.custom(
                            "SF Pro",
                            fixedSize: 40))
                        .foregroundColor(.green)
                        .frame(alignment: .leading)
                    Spacer()
                        .frame(height: 2)
                    Text(String(foodItem.calories) + " cals")
                        .font(.custom(
                            "SF Pro",
                            fixedSize: 30))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                    }
        
             
                Spacer()
                    .frame(height: 10)
                
                //display food description, allows text to expand vertically by using fixedSize modifier
                Text(foodItem.description)
                    .font(.custom("SF Pro", fixedSize: 17))
                    .frame(width: 360)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                    .frame(height: 24)
                //use stepper to allow users to select number of orders they want
                Stepper("\(foodItem.numOrdered.formatted()) pieces", value: $foodItem.numOrdered, in: 1...12, step: 1)
                    .frame(width: 200)
                
                Spacer()
                    .frame(height: 80)
                
                MenuButton(buttonText: "Add to Order", length: 400)
                    .onTapGesture{
                        menuManager.addToOrder(food: foodItem)
                        dismiss()
                    }
                .padding(.horizontal)
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(foodItem: Food(name: "Thing", price: 99, numOrdered: 2, calories: 12, image: "seaweedsalad4",description: "food description goes here"))
    }
}
