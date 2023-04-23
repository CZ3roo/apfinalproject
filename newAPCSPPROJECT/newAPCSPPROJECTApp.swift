//
//  newAPCSPPROJECTApp.swift
//  newAPCSPPROJECT
//
//  Created by Christopher Zhao24 on 3/26/23.
//

import SwiftUI

@main
struct newAPCSPPROJECTApp: App {
    let menuManager = MenuManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
        }
    }
}
