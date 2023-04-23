//
//  DetailView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/27/23.
//

import SwiftUI


struct DetailView: View {
    @EnvironmentObject var menuManager: MenuManager
    @Environment(\.dismiss) var dismiss
   
    @State var foodItem: Food = Food(name: "Example", price: 100000, numOrdered: 1, calories: -1, image: "salmonnigiri")
    var bodyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis"
    
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                //
               
                
                //
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 380, height: 90)
                        .foregroundColor(Color.brown.opacity(0.55))
                    Text(foodItem.name)
                        .frame(alignment: .center)
                        .font(.custom(
                            "SF Pro",
                            fixedSize: 32))
                }
                Image(foodItem.image)
                    .resizable()
                    .frame(width: 400, height: 250)
                    .scaledToFit()
                HStack{
                    VStack{
                        
                        
                        /*
                        NavigationView{
                            NavigationLink(destination: FinishingView(totalCost: 0)) {
                                VStack{
                                    HStack{
                                        Spacer()
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25)
                                                .contentShape(Rectangle())
                                                .frame(width: 140, height: 42)
                                                .foregroundColor(.black.opacity(0.1))
                                            
                                            Text("Checkout")
                                                .foregroundColor(.orange)
                                                .font(.custom(
                                                    "SF Pro",
                                                    fixedSize: 22))
                                                .contentShape(Rectangle())
                                                .frame(width: 100, height: 25)
                                                .bold()
                                            
                                        }
                                    }
                                }
                                Spacer()
                            }
                        }
                        */
                        
                        
                        VStack{
                            Text("$\(String(format: "%.2f", foodItem.price))")
                            
                                .font(.custom(
                                    "SF Pro",
                                    fixedSize: 30))
                                .foregroundColor(.green)
                                .frame(alignment: .leading)
                            Spacer()
                                .frame(height: 2)
                            Text(String(foodItem.calories) + " cals")
                            
                                .font(.custom(
                                    "SF Pro",
                                    fixedSize: 20))
                                .foregroundColor(.black)
                                .frame(alignment: .leading)
                        }
                        
                        
                    }
                    //  .position(x: 50, y: 30)
                }
                Spacer()
                    .frame(height: 10)
                
                Text(bodyText)
                    .font(.custom("SF Pro", fixedSize: 15))
                    .frame(width: 360)
                Spacer()
                    .frame(height: 24)
                
                Stepper("\(foodItem.numOrdered.formatted()) pieces", value: $foodItem.numOrdered, in: 1...12, step: 1)
                    .frame(width: 200)
                
                Spacer()
                    .frame(height: 80)
                ZStack{
                    /*
                     RoundedRectangle(cornerRadius: 25, style: .continuous)
                     .fill(.black)
                     .frame(width: 200, height: 55)
                     */
                    Button(action: {
                        menuManager.addToOrder(food: foodItem)
                        dismiss()
                    }) {
                        Text("Add to Order")
                            .font(.custom(
                                "SF Pro",
                                fixedSize: 20))
                            .padding()
                        
                        //  .background(.white)
                    }
                    .foregroundColor(.orange)
                    .background(.black.opacity(0.69)) // 3
                    .cornerRadius(18)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(foodItem: Food(name: "Thing", price: 99, numOrdered: 2, calories: 12, image: "seaweedsalad"))
    }
}
