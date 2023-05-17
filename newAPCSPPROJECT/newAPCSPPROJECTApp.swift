//
//  newAPCSPPROJECTApp.swift
//  newAPCSPPROJECT
//
//
//

import SwiftUI

@main
struct newAPCSPPROJECTApp: App {
    let menuManager = MenuManager()
    var body: some Scene {
        WindowGroup {
            TitleScreen()
                .environmentObject(menuManager)
        }
    }
}
