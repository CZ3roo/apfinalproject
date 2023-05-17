//
//  ContentView.swift
//  newAPCSPPROJECT
//
//

import SwiftUI

///This view display the list of menu items, on click of the food item, user is brought to the detailView where food detail information will be display. User can also click on 'check out' to go to the finishing view.
struct ContentView: View {
    @StateObject var menuManager = MenuManager()
    @State private var singleSelection: UUID?
    
    var body: some View {
        NavigationView {
            VStack {
                // Menu items are grouped by food categories in the menu list
                List(selection: $singleSelection) {
                    ForEach(foodCategories) { category in
                        Section(header:
                            Text(" \(category.name) ")
                                .font(.title3)
                                .foregroundColor(.orange)
                                .padding(.top, 10) // Adjust the top padding here
                            .bold()
                        ) {
                            ForEach(category.food) { food in
                                // Bring user to detail screen where food detail information is displayed
                                NavigationLink(destination: DetailView(foodItem: food)) {
                                    HStack {
                                        Text(food.name)
                                        Spacer()
                                        Text("Price: \(String(format: "%.2f", food.price))")
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Restaurant Menu")
                .frame(width: 400, height: 625)
                .foregroundColor(.black)
                
                Spacer()
                
                // Bring user to checkout screen
                NavigationLink(destination: FinishingView(totalCost: 0)) {
                    MenuButton(buttonText: "Check out", length: 350)
                }
                .padding(.bottom, 20) // Adjust the padding here
            }
            .accentColor(.orange)
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
