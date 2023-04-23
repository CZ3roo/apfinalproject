//
//  ContentView.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/26/23.
//

import SwiftUI


struct Ocean: Identifiable {
    var name: String
    var id = UUID()
}

struct ContentView: View {
    
    @State private var showPopUp: Bool = false
    
    @State private var coupon = " "
    @StateObject var menuManager = MenuManager()

    @State private var singleSelection: UUID?
    
    var body: some View {
        VStack{
            NavigationView {
                List(selection: $singleSelection) {
                    ForEach(foodCategories) { category in
                        Section(header: Text(" \(category.name) ")
                            .bold()
                            .foregroundColor(.orange)
                        ) {
                            ForEach(category.food) { food in
                                NavigationLink(destination: DetailView(foodItem: food)){
                                    HStack{
                                        Text(food.name)
                                        
                                       // Spacer()
                                        
                                        Text("Price: \(String(format: "%.2f", food.price))")
                                    }
                                }
                            }
                        }
                    }

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
                .navigationTitle("Restaurant Menu")
                .frame(width: 400, height: 665)
                
            }
            /*
            HStack{
                Text("Total: notyet")
                    .foregroundColor(.black)
                
               // Spacer()
                    .frame(width: 200)
                
                
                // MAKE THE BUTTON WORK
                NavigationView {
                    NavigationLink(destination: FinishingView(totalCost: 0)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .contentShape(Rectangle())
                                .frame(width: 120, height: 42)
                            
                            Text("Checkout")
                                .foregroundColor(.green)
                                .contentShape(Rectangle())
                                .frame(width: 80, height: 25)
                            
                        }
                    }
                }
            }
            .frame(height: 50)
            */
            /*
            ZStack {
                NavigationView {
                    ZStack(alignment: .center) {
                        Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)).ignoresSafeArea()
                        Button(action: {
                            withAnimation(.linear(duration: 0.3)) {
                                showPopUp.toggle()
                            }
                        }, label: {
                            Text("Show PopUp Window")
                        })
                        .padding()
                        .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("PopUpWindowSwiftUIExample")
                    .foregroundColor(Color.white)
                }
                PopupView(title: "Coupon", message: "COUPON", buttonText: "Coupon(ok)", show: $showPopUp)
            }
            */

        }
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
