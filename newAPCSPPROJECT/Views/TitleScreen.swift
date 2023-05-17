//
//  titlescreen.swift

import SwiftUI

///entry screen 
struct TitleScreen: View {
    
    let size = CGSize(width: 20, height: 30)
    
    var body: some View {
        NavigationView{
            
            ZStack{
                //  image of food with  Text
               Image("chickensaladsandwich")
                
                    Text("Let's Go Eat!")
                        .font(.system(size: 45))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 250)
                        .background(RoundedRectangle(cornerSize: size).fill(Color.gray.opacity(0.9)).shadow(radius: 30))
                 
            // Makes a massive invisible button so that the user can click anywhere to go to the next screen
                
                    NavigationLink(destination: ContentView()) {
                        Text("")
                            .contentShape(Rectangle())
                            .frame(width: 800, height: 1200)
                            .background(RoundedRectangle(cornerSize: size).fill(Color.white))
                            .opacity(0)
                           
                }
            }
        }

    }
}

struct titlescreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
